﻿using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class UserMakeAppointmentService : BaseService
    {
        public UserMakeAppointmentService() : base() { }
        public UserMakeAppointmentService(IDbConnection db) : base(db) { }
        public bool CreateUserAppointment(UserAppointment model, IDbTransaction transaction = null)
        {
            string query = "INSERT INTO [dbo].[user_appointment]([UserAppointmentId],[UserId],[Name],[Phone],[Email],[DoctorId],[Hour],[Minute],[Day],[Month],[Year],[Status],[CreateTime]) " +
                "VALUES (@UserAppointmentId, @UserId, @Name, @Phone, @Email,@DoctorId, @Hour, @Minute,@Day,  @Month, @Year,@Status, @CreateTime )";
            int status = this._connection.Execute(query, model, transaction);
            return status > 0;
        }
        public bool CreateUserAppointmentService(UserAppointmentService model, IDbTransaction transaction = null)
        {
            string query = "INSERT INTO [dbo].[user_appointment_service]([UserAppointmentServiceId],[UserAppointmentId],[ServiceId]) " +
                "VALUES (@UserAppointmentServiceId, @UserAppointmentId, @ServiceId)";
            int status = this._connection.Execute(query, model, transaction);
            return status > 0;
        }
        public UserAppointment GetUserAppointmentById(string userAppointmentId, IDbTransaction transaction = null)
        {
            string query = "select * from [dbo].[user_appointment] where UserAppointmentId=@userAppointmentId";
            return this._connection.Query<UserAppointment>(query, new { userAppointmentId }, transaction).FirstOrDefault();
        }
        public object GetListAppointmentOfUser(int page, string keyword, string userId, IDbTransaction transaction = null)
        {
            string queryCount = "select count(*) as Total ";
            string querySelect = "select * ";
            string query = " from [user_appointment] where UserId = @userId ";
            if (!string.IsNullOrEmpty(keyword))
            {
                keyword = "%" + keyword.Replace(' ', '%') + "%";
                query += " and Name like @keyword ";
            }
            int TotalPage = 0;
            int totalRow = this._connection.Query<int>(queryCount + query, new { page = page, keyword = keyword, userId = userId }, transaction).FirstOrDefault();
            if (totalRow > 0)
            {
                TotalPage = (int)Math.Ceiling((decimal)totalRow / Constant.PAGE_SIZE);
            }
            int skip = (page - 1) * Constant.PAGE_SIZE;
            query += " order by CreateTime desc offset " + skip + " rows fetch next " + Constant.PAGE_SIZE + " rows only ";
            List<UserAppointment> ListAppointment = this._connection.Query<UserAppointment>(querySelect + query, new { page = page, keyword = keyword, userId = userId }, transaction).ToList();
            return new { TotalPage, ListAppointment };
        }
    }
}