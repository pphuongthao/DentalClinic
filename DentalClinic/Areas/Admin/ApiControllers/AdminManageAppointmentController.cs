using DentalClinic.Models;
using DentalClinic.Providers;
using DentalClinic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace DentalClinic.Areas.Admin.ApiControllers
{
    public class AdminManageAppointmentController : ApiAdminBaseController
    {
        [HttpGet]
        public JsonResult GetListUserAppointment()
        {
            try
            {
                AdminManageAppointmentService adminManageAppointmentService = new AdminManageAppointmentService();
                return Success(adminManageAppointmentService.GetListUserAppointment());
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }


        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult GetListAppointmentOfUser(string UserId, int PageIndex, string AppointmentCode = "", long? CreateStart = null, long? CreateEnd = null)
        {
            try
            {
                UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                if (userAdmin == null) return Unauthorized();

                AdminManageAppointmentService adminManageAppointmentService = new AdminManageAppointmentService();
                ListUserAppointmentView listUserAppointmentView = adminManageAppointmentService.GetListAppointmentOfUser(UserId, PageIndex, AppointmentCode, CreateStart, CreateEnd);
                for (int i = 0; i < listUserAppointmentView.ListUserAppointmentInfor.Count; i++)
                {
                    var item = listUserAppointmentView.ListUserAppointmentInfor[i];
                    List<ServiceDental> lsServiceDental = adminManageAppointmentService.GetServiceByUserAppointmentId(item.UserAppointmentId);
                    decimal totalPriceService = 0;
                    foreach (var _item in lsServiceDental)
                    {
                        totalPriceService += _item.Price;
                    }
                    item.lsServiceDental = new List<ServiceDental>();
                    item.lsServiceDental.AddRange(lsServiceDental);
                    item.TotalAmount = totalPriceService;
                }
                return Success(listUserAppointmentView);
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
    
        [HttpPost]
        public JsonResult AddUserAppointment(User model)
        {
            try
            {
                using(var connection = BaseService.Connect())
                {
                    connection.Open();
                    using(var transaction = connection.BeginTransaction())
                    {
                        AdminManageAppointmentService adminManageAppointmentService = new AdminManageAppointmentService(connection);
                        User user = new User();
                        user.UserId = Guid.NewGuid().ToString();
                        user.Name = model.Name;
                        user.SearchName = model.SearchName.Trim();
                        user.Phone = model.Phone;
                        user.Email = model.Email.Trim();
                        user.Address = model.Address;
                        user.Enable = true;
                        user.CreateTime = HelperProvider.GetSeconds();
                        if (!adminManageAppointmentService.AddUser(user, transaction)) return Error(JsonResult.Message.ERROR_SYSTEM);
                        transaction.Commit();
                        return Success(user);
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpPost]
        [ApiAdminTokenRequire]
        public JsonResult AddAppointment(UserAppointmentRequest model)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        UserService userService = new UserService(connect);
                        DoctorService doctorService = new DoctorService(connect);
                        ServiceService serviceService = new ServiceService(connect);
                        UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService(connect);  
                        Doctor doctor = doctorService.GetDoctorById(model.DoctorId, transaction);
                        if (doctor == null) return Error("Không tồn tại bác sĩ này.");
                        User user = userService.GetUserById(model.UserId, transaction);
                        if (user == null) throw new Exception("Không tìm thấy người dùng");

                        UserAppointment userAppointment = new UserAppointment();
                        userAppointment.UserAppointmentId = Guid.NewGuid().ToString();
                        userAppointment.UserId = user.UserId;
                        userAppointment.AppointmentCode = HelperProvider.MakeCode();
                        userAppointment.Name = user.Name;
                        userAppointment.Phone = user.Phone;
                        userAppointment.Email = user.Email;
                        userAppointment.Address = user.Address;
                        userAppointment.DoctorId = doctor.DoctorId;
                        userAppointment.Hour = model.Hour;
                        userAppointment.Minute = model.Minute;
                        userAppointment.Day = model.Day;
                        userAppointment.Month = model.Month;
                        userAppointment.Year = model.Year;
                        userAppointment.Status = UserAppointment.EnumStatus.PENDING;
                        userAppointment.CreateTime = HelperProvider.GetSeconds();

                        int totalExpectTime = 0;
                        decimal totalPrice = 0;
                        for (int i = 0; i < model.ListServiceId.Count; i++)
                        {
                            string ServiceId = model.ListServiceId[i].ServiceId;
                            ServiceDental serviceDental = serviceService.GetServiceById(ServiceId, transaction);

                            UserAppointmentService userAppointmentService = new UserAppointmentService();
                            userAppointmentService.UserAppointmentServiceId = Guid.NewGuid().ToString();
                            userAppointmentService.UserAppointmentId = userAppointment.UserAppointmentId;
                            userAppointmentService.ServiceId = serviceDental.ServiceId;
                            userAppointmentService.ExpectTime = serviceDental.ExpectTime;
                            totalExpectTime += serviceDental.ExpectTime;
                            totalPrice += serviceDental.Price;
                            if (!userMakeAppointmentService.CreateUserAppointmentService(userAppointmentService, transaction)) throw new Exception();
                        }
                        userAppointment.TotalExpectTime = totalExpectTime;
                        userAppointment.TotalAmount = totalPrice;
                        // lấy ra danh sách đơn của bác sĩ ngày đơn đặt mới
                        List<UserAppointment> lsuserAppointmentsByDoctor = userMakeAppointmentService.GetListUserAppointmentByDoctorId(model.DoctorId, model.Day, model.Month, model.Year, transaction);
                        List<TimeDoctor> lstimeDoctors = new List<TimeDoctor>();
                        for (int i = 0; i < lsuserAppointmentsByDoctor.Count; i++)
                        {
                            TimeDoctor timeDoctor = new TimeDoctor();
                            timeDoctor.MinTime = lsuserAppointmentsByDoctor[i].Hour * 60 + lsuserAppointmentsByDoctor[i].Minute;
                            timeDoctor.MaxTime = timeDoctor.MinTime + lsuserAppointmentsByDoctor[i].TotalExpectTime;
                            lstimeDoctors.Add(timeDoctor);
                        }
                        int minTime = model.Hour * 60 + model.Minute;
                        int maxTime = minTime + userAppointment.TotalExpectTime;
                        bool checkOrder = UserProvider.CheckTimeOrder(minTime, maxTime, lstimeDoctors, connect, transaction);
                        if (checkOrder == false)
                        {
                            throw new Exception("Bác sĩ bận trong thời gian này, vui lòng chọn bác sĩ hoặc thời gian khác");
                        }
                        if (!userMakeAppointmentService.CreateUserAppointment(userAppointment, transaction)) throw new Exception();
                        transaction.Commit();
                        return Success(new { AppointmentCode = userAppointment.AppointmentCode });
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }


        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult GetListAllAppointment(int PageIndex, string AppointmentCode = "", long? CreateStart = null, long? CreateEnd = null)
        {
            try
            {
                UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                if (userAdmin == null) return Unauthorized();

                AdminManageAppointmentService adminManageAppointmentService = new AdminManageAppointmentService();
                ListUserAppointmentView listUserAppointmentView = adminManageAppointmentService.GetListAllAppointment(PageIndex, AppointmentCode, CreateStart, CreateEnd);
                for (int i = 0; i < listUserAppointmentView.ListUserAppointmentInfor.Count; i++)
                {
                    var item = listUserAppointmentView.ListUserAppointmentInfor[i];
                    List<ServiceDental> lsServiceDental = adminManageAppointmentService.GetServiceByUserAppointmentId(item.UserAppointmentId);
                    decimal totalPriceService = 0;
                    foreach (var _item in lsServiceDental)
                    {
                        totalPriceService += _item.Price;
                    }
                    item.lsServiceDental = new List<ServiceDental>();
                    item.lsServiceDental.AddRange(lsServiceDental);
                    item.TotalAmount = totalPriceService;
                }
                return Success(listUserAppointmentView);
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult ConfirmAppointment(string userAppointmentId)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                        if (userAdmin == null) return Unauthorized();

                        UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService(connect);
                        AppointmentStatusService appointmentStatusService = new AppointmentStatusService(connect);
                        // Lấy ra user appointment
                        UserAppointment userAppointment = userMakeAppointmentService.GetUserAppointmentById(userAppointmentId, transaction);
                        if (userAppointment == null) throw new Exception("Không tìm thấy lịch hẹn !");
                        if (userAppointment.Status != UserAppointment.EnumStatus.PENDING) throw new Exception("Trạng thái lịch hẹn không hợp lệ !");

                        // Set lại trạng thái appointment
                        if (!userMakeAppointmentService.UpdateUserAppointmentStatus(userAppointmentId, UserAppointment.EnumStatus.RECEIVE, transaction)) throw new Exception();

                        // Lưu lịch sử appointment_status
                        AppointmentStatus appointmentStatus = new AppointmentStatus();
                        appointmentStatus.AppointmentStatusId = Guid.NewGuid().ToString();
                        appointmentStatus.UserAppointmentId = userAppointmentId;
                        appointmentStatus.Status = UserAppointment.EnumStatus.RECEIVE;
                        appointmentStatus.CreateTime = HelperProvider.GetSeconds();
                        if (!appointmentStatusService.CreateAppointmentStatus(appointmentStatus, transaction)) throw new Exception();

                        // Thông báo cho người dùng
                        Notification notification = new Notification();
                        notification.UserId = userAppointment.UserId;
                        notification.Title = "Thông báo";
                        notification.Message = "Lịch hẹn: " + userAppointment.AppointmentCode + " của bạn đã được tiếp nhận bởi phòng khám.";
                        notification.IsRead = false;
                        notification.CreateTime = HelperProvider.GetSeconds();
                        if (!NotificationProvider.CreateNotification(notification, connect, transaction)) throw new Exception();

                        transaction.Commit();
                        return Success();
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }


        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult SystemCancelAppointment(string userAppointmentId)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        UserService userService = new UserService(connect);
                        UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService(connect);
                        AppointmentStatusService appointmentStatusService = new AppointmentStatusService(connect);
                        UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                        if (userAdmin == null) return Unauthorized();

                        // Lấy ra
                        UserAppointment userAppointment = userMakeAppointmentService.GetUserAppointmentById(userAppointmentId, transaction);
                        if (userAppointment == null) throw new Exception("Không tìm thấy lịch hẹn !");
                        if (userAppointment.Status == UserAppointment.EnumStatus.DONE || userAppointment.Status == UserAppointment.EnumStatus.USER_CANCEL || userAppointment.Status == UserAppointment.EnumStatus.SYSTEM_CANCEL) throw new Exception("Trạng thái lịch hẹn không hợp lệ !");
                        // Set lại trạng thái 
                        if (!userMakeAppointmentService.UpdateUserAppointmentStatus(userAppointmentId, UserAppointment.EnumStatus.SYSTEM_CANCEL, transaction)) throw new Exception();

                        // Lưu lịch sử Order_status
                        AppointmentStatus appointmentStatus = new AppointmentStatus();
                        appointmentStatus.AppointmentStatusId = Guid.NewGuid().ToString();
                        appointmentStatus.UserAppointmentId = userAppointmentId;
                        appointmentStatus.Status = UserAppointment.EnumStatus.SYSTEM_CANCEL;
                        appointmentStatus.CreateTime = HelperProvider.GetSeconds();
                        if (!appointmentStatusService.CreateAppointmentStatus(appointmentStatus, transaction)) throw new Exception();

                        // Thông báo cho người dùng
                        Notification notification = new Notification();
                        notification.UserId = userAppointment.UserId;
                        notification.Title = "Thông báo";
                        notification.Message = "Lịch hẹn: " + userAppointment.AppointmentCode + " của bạn đã bị hủy bởi phòng khám.";
                        notification.IsRead = false;
                        notification.CreateTime = HelperProvider.GetSeconds();
                        if (!NotificationProvider.CreateNotification(notification, connect, transaction)) throw new Exception();

                        transaction.Commit();
                        return Success();
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult ConfirmArrive(string userAppointmentId)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        UserService userService = new UserService(connect);
                        UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService(connect);
                        AppointmentStatusService appointmentStatusService = new AppointmentStatusService(connect);
                        UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                        if (userAdmin == null) return Unauthorized();

                        // Lấy ra
                        UserAppointment userAppointment = userMakeAppointmentService.GetUserAppointmentById(userAppointmentId, transaction);
                        if (userAppointment == null) throw new Exception("Không tìm thấy lịch hẹn !");
                        if (userAppointment.Status == UserAppointment.EnumStatus.DONE || userAppointment.Status == UserAppointment.EnumStatus.USER_CANCEL || userAppointment.Status == UserAppointment.EnumStatus.SYSTEM_CANCEL) throw new Exception("Trạng thái lịch hẹn không hợp lệ !");
                        // Set lại trạng thái 
                        if (!userMakeAppointmentService.UpdateUserAppointmentStatus(userAppointmentId, UserAppointment.EnumStatus.CONFIRM_ARRIVE, transaction)) throw new Exception();

                        // Lưu lịch sử status
                        AppointmentStatus appointmentStatus = new AppointmentStatus();
                        appointmentStatus.AppointmentStatusId = Guid.NewGuid().ToString();
                        appointmentStatus.UserAppointmentId = userAppointmentId;
                        appointmentStatus.Status = UserAppointment.EnumStatus.CONFIRM_ARRIVE;
                        appointmentStatus.CreateTime = HelperProvider.GetSeconds();
                        if (!appointmentStatusService.CreateAppointmentStatus(appointmentStatus, transaction)) throw new Exception();

                        // Thông báo cho người dùng
                        Notification notification = new Notification();
                        notification.UserId = userAppointment.UserId;
                        notification.Title = "Thông báo";
                        notification.Message = "Phòng khám xác nhận bạn đã đến phòng khám.";
                        notification.IsRead = false;
                        notification.CreateTime = HelperProvider.GetSeconds();
                        if (!NotificationProvider.CreateNotification(notification, connect, transaction)) throw new Exception();

                        transaction.Commit();
                        return Success();
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult DoneAppointment(string userAppointmentId)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService(connect);
                        AppointmentStatusService appointmentStatusService = new AppointmentStatusService(connect);
                        AdminSystemWalletService adminSystemWalletService = new AdminSystemWalletService(connect);
                        AdminSystemTransactionService adminSystemTransactionService = new AdminSystemTransactionService(connect);
                        AdminReportService adminReportService = new AdminReportService(connect);
                        UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                        if (userAdmin == null) return Unauthorized();

                        // Lấy ra
                        UserAppointment userAppointment = userMakeAppointmentService.GetUserAppointmentById(userAppointmentId, transaction);
                        if (userAppointment == null) throw new Exception("Không tìm thấy lịch hẹn !");
                        if (userAppointment.Status == UserAppointment.EnumStatus.DONE || userAppointment.Status == UserAppointment.EnumStatus.USER_CANCEL || userAppointment.Status == UserAppointment.EnumStatus.SYSTEM_CANCEL) throw new Exception("Trạng thái lịch hẹn không hợp lệ !");

                        // Set lại trạng thái 
                        if (!userMakeAppointmentService.UpdateUserAppointmentStatus(userAppointmentId, UserAppointment.EnumStatus.DONE, transaction)) throw new Exception();

                        DateTime now = DateTime.Now;
                        // Cộng tiền thu của hóa đơn vào trong ví khách sạn, và báo cáo
                        adminSystemWalletService.UpdateRevenueSystem(userAppointment.TotalAmount, transaction);

                        SystemTransaction systemTransaction = new SystemTransaction();
                        systemTransaction.SystemTransactionId = Guid.NewGuid().ToString();
                        systemTransaction.Amount = userAppointment.TotalAmount;
                        systemTransaction.Message = "Tiền thu từ hóa đơn của khách hàng " + userAppointment.Name + " đã khám xong.";
                        systemTransaction.CreateTime = HelperProvider.GetSeconds(now);
                        adminSystemTransactionService.InsertSystemTransaction(systemTransaction, transaction);

                        // Thêm vào bảng báo cáo
                        ReportDaily reportDaily = adminReportService.GetReportDailyByDayMonthYear(now.Day, now.Month, now.Year, transaction);
                        if (reportDaily == null)
                        {
                            reportDaily = new ReportDaily();
                            reportDaily.ReportDailyId = Guid.NewGuid().ToString();
                            reportDaily.TotalPrice = userAppointment.TotalAmount;
                            reportDaily.Day = now.Day;
                            reportDaily.Month = now.Month;
                            reportDaily.Year = now.Year;
                            adminReportService.InsertReportDaily(reportDaily, transaction);
                        }
                        else
                        {
                            adminReportService.UpdateTotalPriceByReportDailyId(userAppointment.TotalAmount, reportDaily.ReportDailyId, transaction);
                        }
                        ReportMonthly reportMonthly = adminReportService.GetReportMonthlyByMonthYear(now.Month, now.Year, transaction);
                        if (reportMonthly == null)
                        {
                            reportMonthly = new ReportMonthly();
                            reportMonthly.ReportMonthlyId = Guid.NewGuid().ToString();
                            reportMonthly.TotalPrice = userAppointment.TotalAmount;
                            reportMonthly.Month = now.Month;
                            reportMonthly.Year = now.Year;
                            adminReportService.InsertReportMonthly(reportMonthly, transaction);
                        }
                        else
                        {
                            adminReportService.UpdateTotalPriceByReportMonthlyId(userAppointment.TotalAmount, reportMonthly.ReportMonthlyId, transaction);
                        }
                        ReportYearly reportYearly = adminReportService.GetReportYearlyByYear(now.Year, transaction);
                        if (reportYearly == null)
                        {
                            reportYearly = new ReportYearly();
                            reportYearly.ReportYearlyId = Guid.NewGuid().ToString();
                            reportYearly.TotalPrice = userAppointment.TotalAmount;
                            reportYearly.Year = now.Year;
                            adminReportService.InsertReportYearly(reportYearly, transaction);
                        }
                        else
                        {
                            adminReportService.UpdateTotalPriceByReportYearlyId(userAppointment.TotalAmount, reportYearly.ReportYearlyId, transaction);
                        }


                        // Lưu lịch sử status
                        AppointmentStatus appointmentStatus = new AppointmentStatus();
                        appointmentStatus.AppointmentStatusId = Guid.NewGuid().ToString();
                        appointmentStatus.UserAppointmentId = userAppointmentId;
                        appointmentStatus.Status = UserAppointment.EnumStatus.DONE;
                        appointmentStatus.CreateTime = HelperProvider.GetSeconds();
                        if (!appointmentStatusService.CreateAppointmentStatus(appointmentStatus, transaction)) throw new Exception();

                        // Thông báo cho người dùng
                        Notification notification = new Notification();
                        notification.UserId = userAppointment.UserId;
                        notification.Title = "Thông báo";
                        notification.Message = "Lịch hẹn: " + userAppointment.AppointmentCode + " của bạn đã hoàn thành.";
                        notification.IsRead = false;
                        notification.CreateTime = HelperProvider.GetSeconds();
                        if (!NotificationProvider.CreateNotification(notification, connect, transaction)) throw new Exception();

                        transaction.Commit();
                        return Success();
                    }
                
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
    }
}
