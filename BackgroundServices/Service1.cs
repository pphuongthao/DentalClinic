using DentalClinic.Providers;
using DentalClinic.Services;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Timers;

namespace BackgroundServices
{
    public partial class Service1 : ServiceBase
    {
        Timer timer = new Timer();
        string constr = "Data Source=DESKTOP-JINTQRI\\SQLEXPRESS;Initial Catalog=DentalClinicTest;User ID=sa;Password=123;MultipleActiveResultSets=True;persist security info=True;";
        TimeSpan delay;

        public Service1()
        {
            delay = TimeSpan.FromMinutes(1);
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            WriteLog($"Worker starting at {DateTime.Now.ToString()}...");

            timer.Elapsed += new ElapsedEventHandler(Execute1);
            timer.Interval = delay.TotalMilliseconds;
            timer.Enabled = true;
        }

        private void Execute1(object source, ElapsedEventArgs e)
        {
            DoSendMail(source, e);
            DoUpdateOutDateAppointment(source, e);
        }

        protected override void OnStop()
        {
            WriteLog($"Worker stopping at {DateTime.Now.ToString()}...");
        }

        private void DoUpdateOutDateAppointment(object source, ElapsedEventArgs e)
        {
            WriteLog($"DoUpdateOutDateAppointment at {DateTime.Now.ToString()}...");
            try
            {
                //"2023-06-09-23-07"(HIỆN TẠI) >= "2023-06-09-15-07"(DATABASE)
                //FUNCTION FORMAT SANG DẠNG "2023-06-09-15-07" ĐỂ SO SÁNH
                Func<int, int, int, int, int, string> FormatDate = (year, month, day, hour, minute) =>
                {
                    //2023-10-06
                    string date =  $"{year.ToString().PadLeft(4, '0')}-{month.ToString().PadLeft(2, '0')}-{day.ToString().PadLeft(2, '0')}-{hour.ToString().PadLeft(2, '0')}-{minute.ToString().PadLeft(2, '0')}";
                    return date;
                };

                #region LOG
                var now = DateTime.Now;
                var dateS = $"{now.Year.ToString().PadLeft(4, '0')}-{now.Month.ToString().PadLeft(2, '0')}-{now.Day.ToString().PadLeft(2, '0')}-{now.ToString("HH-mm")}";
                WriteLog($"dateS at {dateS}");
                #endregion

                IDbConnection connection = new SqlConnection(constr);
                AdminManageAppointmentService service = new AdminManageAppointmentService(connection);
                var appointments = service.GetListOutDateUserAppointment();

                //QUAN TRỌNG -> so sánh thời gian: thời gian trong db nhỏ hơn hoặc bàng thời gian hiện tại thì cập nhập outdate
                //lọc đến hẹn = [thời gian bắt đầu hẹn, thời gian bắt đầu hẹn + ước lượng] --> update
                //appointments.ListUserAppointmentInfor = appointments.ListUserAppointmentInfor.Where(f => f.Status == "RECEIVE").ToList();
                
                var dueTime = appointments.ListUserAppointmentInfor.Where(f => {
                    var appTime = new DateTime(f.Year, f.Month, f.Day, f.Hour, f.Minute, 0, DateTimeKind.Local);
                    var exTime = appTime + TimeSpan.FromMinutes(f.TotalExpectTime);

                    var lower = FormatDate(appTime.Year, appTime.Month, appTime.Day, appTime.Hour, appTime.Minute);
                    var upper = FormatDate(exTime.Year, exTime.Month, exTime.Day, exTime.Hour, exTime.Minute);
                    string nowStr = $"{now.Year.ToString().PadLeft(4, '0')}-{now.Month.ToString().PadLeft(2, '0')}-{now.Day.ToString().PadLeft(2, '0')}-{now.ToString("HH-mm")}";

                    return f.Status == "RECEIVE" && nowStr.CompareTo(lower) >= 0 && nowStr.CompareTo(upper) <= 0;
                }).ToList();
                WriteLog($"dueTime = {JsonConvert.SerializeObject(dueTime)}");

                //lọc quá hẹn = (thời gian bắt đầu hẹn + ước lượng, +OO] --> update
                var overTime = appointments.ListUserAppointmentInfor.Where(f => {
                    var exTime = new DateTime(f.Year, f.Month, f.Day, f.Hour, f.Minute, 0, DateTimeKind.Local) + TimeSpan.FromMinutes(f.TotalExpectTime);
                    WriteLog($"exTime = {exTime}");
                    var lower = FormatDate(exTime.Year, exTime.Month, exTime.Day, exTime.Hour, exTime.Minute);
                    WriteLog($"lower = {lower}");
                    string nowStr = $"{now.Year.ToString().PadLeft(4, '0')}-{now.Month.ToString().PadLeft(2, '0')}-{now.Day.ToString().PadLeft(2, '0')}-{now.ToString("HH-mm")}";
                    WriteLog($"nowStr = {nowStr}");

                    WriteLog($"res = {JsonConvert.SerializeObject(nowStr.CompareTo(lower) > 0 && (f.Status == "CONFIRM_ARRIVE"))}");
                    
                    WriteLog($"f = {JsonConvert.SerializeObject(f)}");
                    return nowStr.CompareTo(lower) > 0 &&  ( f.Status == "CONFIRM_ARRIVE");
                }).ToList();
                
                WriteLog($"overTime = {JsonConvert.SerializeObject(overTime)}");

                //UPDATE
                Func<List<DentalClinic.Models.UserAppointmentInfor>, string, bool> UpdateStatus = (apps, status) =>
                {
                    string ids = $"|{string.Join("|", apps.Select(f => f.UserAppointmentId))}|";
                    if (connection.State == ConnectionState.Closed)
                    {
                        connection.Open();
                    }
                    var success = service.UpdateOutdateStatus(ids, status);
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                        connection.Dispose();
                    }

                    return true;
                };

                if (dueTime.Any())
                {
                    UpdateStatus(dueTime, "CONFIRM_ARRIVE");
                }

                if (overTime.Any())
                {
                    UpdateStatus(overTime, "OUT_DATE");
                }

                #region LOG
                //WriteLog($"DoUpdateOutDateAppointment appointments={JsonConvert.SerializeObject(appointments.ListUserAppointmentInfor.Select(f => f.UserAppointmentId))}");
                #endregion

                //if (appointments.ListUserAppointmentInfor.Count > 0)
                //{
                //    //cơ chế update nhiều bản ghi trong database

                //    /*
                //     *  ids = ["id1", "id2", "id3"]
                //     *  => "|id1|id2|id3|" để làm gì ?
                //     *  
                //     *   where '{ids}' like CONCAT('%|',UserAppointmentId,'|%');
                //     */
                //    string ids = $"|{string.Join("|", appointments.ListUserAppointmentInfor.Select(f => f.UserAppointmentId))}|";

                //    WriteLog($"DoUpdateOutDateAppointment ids={ids}");

                //    if (connection.State == ConnectionState.Closed)
                //    {
                //        connection.Open();
                //    }
                //    var success = service.UpdateOutdateStatus(ids);
                //    if (connection.State == ConnectionState.Open)
                //    {
                //        connection.Close();
                //        connection.Dispose();
                //    }
                //    WriteLog($"DoUpdateOutDateAppointment success={success}");
                //}
            }
            catch (Exception ex)
            {
                WriteLog($"DoUpdateOutDateAppointment error={ex.Message} at {DateTime.Now.ToString()}...");
            }
        }

        private void DoSendMail(object source, ElapsedEventArgs e)
        {
            WriteLog($"Send Mail at {DateTime.Now.ToString()}...");
            try
            {
                IDbConnection connection = new SqlConnection(constr);
                AdminManageAppointmentService service = new AdminManageAppointmentService(connection);

                var appointments = service.GetListUserAppointment();
                if (appointments.ListUserAppointmentInfor.Count > 0)
                {
                    appointments.ListUserAppointmentInfor = appointments.ListUserAppointmentInfor.Where(f => f.Status == "RECEIVE").ToList();
                }

                var remindAppointments = appointments.ListUserAppointmentInfor.Where(f =>
                {
                    if (!TimeSpan.TryParse(f.Remind, out TimeSpan _)) return false;
                    var now = DateTime.Now;
                    var timespan = (new DateTime(now.Year, now.Month, now.Day, now.Hour, now.Minute, 0) + TimeSpan.Parse(f.Remind));
                    var dueDate = new DateTime(f.Year, f.Month, f.Day, f.Hour, f.Minute, 0);

                    //HIỆN TẠI (NOW) + REMIND == dueDate  (LƯU TRONG DATABASE)
                    WriteLog($"[Appointments] Time={DateTime.Now.ToString()}==============================");
                    WriteLog($"timespan = {JsonConvert.SerializeObject(timespan)}");
                    WriteLog($"dueDate = {JsonConvert.SerializeObject(dueDate)}");
                    //= TimeSpan.Parse(string.Format("{0}:{1}:00.000", f.Hour.ToString().PadLeft(2, '0'), f.Minute.ToString().PadLeft(2, '0'))).TotalMilliseconds;
                    return timespan == dueDate && isValidEmail(f.Email);
                });

                foreach (var item in remindAppointments)
                {
                    WriteLog($"[DoSendMail]  email = {JsonConvert.SerializeObject(item.Email)}");
                    try
                    {
                        var sendSuccess = SMSProvider.SendOTPViaEmailRemind(item.Email, item.Name, item.AppointmentCode, item.Day, item.Month, item.Year, item.Hour, item.Minute, item.Remind, "NHẮC NHỞ LỊCH HẸN", " Phòng khám nha khoa Phương Thảo đã tiếp nhận lịch hẹn [" + item.AppointmentCode + "] của bạn. Hãy chú ý để đến phòng khám đúng hẹn. Xin trân trọng cảm ơn!");
                    }
                    catch (Exception ex)
                    {
                        WriteLog($"[DoSendMail] Lỗi gửi cho email = {JsonConvert.SerializeObject(ex)}");
                    }
                }

                WriteLog($"Appointments = {JsonConvert.SerializeObject(remindAppointments)}");
            }
            catch (Exception ex)
            {
                WriteLog($"[Appointments] Time={DateTime.Now.ToString()} Error = {JsonConvert.SerializeObject(ex)}");
            }
        }

        private bool isValidEmail(string email)
        {
            return true;
        }

        private double GetTimeRun(List<TimeSpan> timeSpans)
        {
            var now = DateTime.Now;
            var today = DateTime.Today;

            foreach (var timeSpan in timeSpans)
            {
                if (now == today + timeSpan) return 0;
                else if (today + timeSpan > now)
                {
                    return (today + timeSpan - now).TotalMilliseconds;
                }
            }
            return (today.AddDays(1) + timeSpans.FirstOrDefault() - now).TotalMilliseconds;
        }

        private void WriteLog(string message)
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + "\\Logs\\";
            if (!System.IO.Directory.Exists(path))
            {
                System.IO.Directory.CreateDirectory(path);
            }

            string file = path + DateTime.Now.ToString("dd-MM-yyyy") + ".txt";

            if (!System.IO.File.Exists(file))
            {
                using (StreamWriter wt = File.CreateText(file))
                {
                    wt.WriteLine(message);
                }
            }
            else
            {
                using (StreamWriter wt = File.AppendText(file))
                {
                    wt.WriteLine(message);
                }
            }

        }
    }
}
