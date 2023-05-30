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

            var datetimes = new List<TimeSpan> { new TimeSpan(00, 14, 0) };

            timer.Elapsed += new ElapsedEventHandler(DoSendMail);
            timer.Interval = delay.TotalMilliseconds;
            timer.Enabled = true;
        }

        protected override void OnStop()
        {
            WriteLog($"Worker stopping at {DateTime.Now.ToString()}...");
        }

        private void DoSendMail(object source, ElapsedEventArgs e)
        {
            WriteLog($"Send Mail at {DateTime.Now.ToString()}...");
            try
            {
                //CONCAT('W3Schools', '.com'); CONVERT(col1,char)


                IDbConnection connection = new SqlConnection(constr);
                AdminManageAppointmentService service = new AdminManageAppointmentService(connection);

                var appointments = service.GetListUserAppointment();
                if (appointments.TotalPage > 0)
                {
                    appointments.ListUserAppointmentInfor = appointments.ListUserAppointmentInfor.Where(f => f.Status == "RECEIVE").ToList();
                }

                var remindAppointments = appointments.ListUserAppointmentInfor.Where(f =>
                {
                    if (!TimeSpan.TryParse(f.Remind, out TimeSpan _)) return false;
                    var now = DateTime.Now;
                    var timespan = (new DateTime(now.Year, now.Month, now.Day, now.Hour, now.Minute, 0) + TimeSpan.Parse(f.Remind));
                    var dueDate = new DateTime(f.Year, f.Month, f.Day, f.Hour, f.Minute, 0);

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
                        var sendSuccess = SMSProvider.SendOTPViaEmail(item.Email, "", "NHẮC NHỞ LỊCH KHÁM", " Phòng khám nha khoa Phương Thảo đã tiếp nhận lịch hẹn [" + item.AppointmentCode + "] của bạn. Hãy chú ý để đến phòng khám đúng hẹn. Xin trân trọng cảm ơn!", 2);
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
