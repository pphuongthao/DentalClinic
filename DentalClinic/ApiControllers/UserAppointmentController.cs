﻿using DentalClinic.Filters;
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

namespace DentalClinic.ApiControllers
{
    public class UserAppointmentController : ApiBaseController
    {
        [HttpPost]
        [ApiTokenRequire]
        public JsonResult CreateUserAppointment(UserAppointmentRequest model)
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
                        UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService(connect);
                        string token = Request.Headers.Authorization.ToString();
                        User user = userService.GetUserByToken(token, transaction);
                        if (user == null) return Unauthorized();
                        if (user.Name == null || user.Phone == null || user.Email == null || user.Address == null) throw new Exception("Bạn vui lòng cập nhật đầy đủ thông tin tài khoản");
                        Doctor doctor = doctorService.GetDoctorById(model.DoctorId, transaction);
                        if (doctor == null) return Error("Không tồn tại bác sĩ này.");
                        UserAppointment userAppointment = new UserAppointment();
                        userAppointment.UserAppointmentId = Guid.NewGuid().ToString();
                        userAppointment.UserId = user.UserId;
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

                       for(int i = 0; i<model.ListService.Count; i++)
                        {
                            UserAppointmentService userAppointmentService = new UserAppointmentService();
                            userAppointmentService.UserAppointmentServiceId = Guid.NewGuid().ToString();
                            userAppointmentService.UserAppointmentId = userAppointment.UserAppointmentId;
                            userAppointmentService.ServiceId = model.ListService[i].ServiceId;
                            if (!userMakeAppointmentService.CreateUserAppointmentService(userAppointmentService, transaction)) throw new Exception();
                        }
                        if (!userMakeAppointmentService.CreateUserAppointment(userAppointment, transaction)) throw new Exception();
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
        [ApiTokenRequire]
        public JsonResult GetListAppointmentOfUser(int page, string keyword)
        {
            try
            {
                User user = SecurityProvider.GetUserByToken(Request);
                if (user == null) return Unauthorized();
                UserMakeAppointmentService userMakeAppointmentService = new UserMakeAppointmentService();
                return Success(userMakeAppointmentService.GetListAppointmentOfUser(page, keyword, user.UserId));
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
        [HttpGet]
        [ApiTokenRequire]
        public JsonResult GetUserById(string userId)
        {
            try
            {
                User user = SecurityProvider.GetUserByToken(Request);
                if (user == null) return Unauthorized();
                UserService userService = new UserService();
                return Success(userService.GetUserById(userId));

            }
            catch (Exception ex)
            {
                return Error(ex.Message);

            }
        }
    }
}