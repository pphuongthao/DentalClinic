using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class AdminManageAppointmentService : BaseService
    {
        public AdminManageAppointmentService() : base() { }

        public AdminManageAppointmentService(IDbConnection db) : base(db) { }


        public ListUserAppointmentView GetListOutDateUserAppointment( IDbTransaction transaction = null)
        {
            ListUserAppointmentView listUserAppointmentView = new ListUserAppointmentView();
            listUserAppointmentView.ListUserAppointmentInfor = new List<UserAppointmentInfor>();

            string query = $"select * from [user_appointment]";

            listUserAppointmentView.ListUserAppointmentInfor = this._connection.Query<UserAppointmentInfor>(query).ToList();
            return listUserAppointmentView;
        }

        public bool UpdateOutdateStatus(string ids,string status = "OUT_DATE", IDbTransaction transaction = null)
        {
            string query = $"update user_appointment  set Status='{status}' where '{ids}' like CONCAT('%|',UserAppointmentId,'|%');";
            var res = (int)this._connection.ExecuteScalar(query, transaction: transaction);
            return res > 0;
        }

        public ListUserAppointmentView GetListUserAppointment(IDbTransaction transaction = null)
        {
            ListUserAppointmentView listUserAppointmentView = new ListUserAppointmentView();
            listUserAppointmentView.ListUserAppointmentInfor = new List<UserAppointmentInfor>();
            string query = "select * from [user_appointment]";
            listUserAppointmentView.ListUserAppointmentInfor = this._connection.Query<UserAppointmentInfor>(query).ToList();
            return listUserAppointmentView;
        }
        public ListUserAppointmentView GetListAppointmentOfUser(string UserId, int PageIndex, string AppointmentCode = "", string CreateStart = "", string CreateEnd = "")
        {
            ListUserAppointmentView listUserAppointmentView = new ListUserAppointmentView();
            string queryCount = "select count(*) as Total ";
            string querySelect = "select ua.*, d.Name As NameDoctor ";
            string queryWhere = "from [user_appointment] ua join [doctor] d on ua.DoctorId = d.DoctorId where ua.UserId = @UserId ";

            if (!string.IsNullOrEmpty(AppointmentCode))
            {
                queryWhere += $"and ua.AppointmentCode like '%{AppointmentCode}%' ";
            }
            if (!string.IsNullOrEmpty(CreateStart))
            {
                queryWhere += $"and cast( (cast([Year] as varchar)+ '/' +cast([Month] as varchar) + '/' + cast([Day] as varchar)) as date) >= '{CreateStart}' ";
            }
            if (!string.IsNullOrEmpty(CreateEnd))
            {
                queryWhere += $"and cast( (cast([Year] as varchar)+ '/' +cast([Month] as varchar) + '/' + cast([Day] as varchar)) as date) <= '{CreateEnd}' ";
            }

            int totalRow = this._connection.Query<int>(queryCount + queryWhere, new { UserId, AppointmentCode }).FirstOrDefault();
            int skip = (PageIndex - 1) * 20;
            int totalPage = (int)Math.Ceiling((decimal)totalRow / 20);
            queryWhere += " order by CreateTime desc offset  " + skip + " rows fetch next 20 rows only ";

            listUserAppointmentView.ListUserAppointmentInfor = this._connection.Query<UserAppointmentInfor>(querySelect + queryWhere, new { UserId, AppointmentCode }).ToList();
            listUserAppointmentView.TotalPage = totalPage;
            return listUserAppointmentView;


        }
        public List<ServiceDental> GetServiceByUserAppointmentId(string UserAppointmentId, IDbTransaction transaction = null)
        {
            string query = "select s.* from [user_appointment_service] uas right join [service] s on uas.ServiceId = s.ServiceId where uas.UserAppointmentId = @UserAppointmentId";
            return this._connection.Query<ServiceDental>(query, new { UserAppointmentId }, transaction).ToList();
        }
        public bool AddUser(User user, IDbTransaction transaction = null)
        {
            string query = "INSERT INTO [user]([UserId], [Name], [SearchName], [Email], [Phone], [Address], [Enable], [CreateTime]) VALUES (@UserId, @Name, @SearchName, @Email, @Phone, @Address, @Enable, @CreateTime)";
            return _connection.Execute(query, user , transaction) > 0;
        }

        public ListUserAppointmentView GetListAllAppointment(int PageIndex, string AppointmentCode = "", string CreateStart = "", string CreateEnd = "", string status = "", IDbTransaction transaction = null)
        {
            ListUserAppointmentView listUserAppointmentView = new ListUserAppointmentView();
            string queryCount = "select count(*) as Total ";
            string querySelect = "select ua.*, d.Name As NameDoctor ";
            string queryWhere = "from [user_appointment] ua join [doctor] d on ua.DoctorId = d.DoctorId where 1=1 ";

            if (!string.IsNullOrEmpty(AppointmentCode))
            {
                queryWhere += $"and AppointmentCode like '%{AppointmentCode}%' ";
            }
            if (!string.IsNullOrEmpty(status))
            {
                queryWhere += " and Status = @status ";
            }
            if ( !string.IsNullOrEmpty(CreateStart))
            {
                queryWhere += $"and cast( (cast([Year] as varchar)+ '/' +cast([Month] as varchar) + '/' + cast([Day] as varchar)) as date) >= '{CreateStart}' ";
            }
            if (!string.IsNullOrEmpty(CreateEnd))
            {
                queryWhere += $"and cast( (cast([Year] as varchar)+ '/' +cast([Month] as varchar) + '/' + cast([Day] as varchar)) as date) <= '{CreateEnd}' ";
            }

            int totalRow = this._connection.Query<int>(queryCount + queryWhere, new {AppointmentCode, status }, transaction).FirstOrDefault();
            int skip = (PageIndex - 1) * 20;
            int totalPage = (int)Math.Ceiling((decimal)totalRow / 20);
            queryWhere += " order by ua.CreateTime desc offset  " + skip + " rows fetch next 20 rows only ";

            listUserAppointmentView.ListUserAppointmentInfor = this._connection.Query<UserAppointmentInfor>(querySelect + queryWhere, new { AppointmentCode, status }, transaction).ToList();
            listUserAppointmentView.TotalPage = totalPage;
            return listUserAppointmentView;

        }
        public bool AddAppointmentServiceToDetail(UserAppointmentService model, IDbTransaction transaction = null)
        {
            string query = "INSERT INTO [dbo].[user_appointment_service]([UserAppointmentServiceId],[UserAppointmentId],[ServiceId],[ExpectTime]) " +
                "VALUES (@UserAppointmentServiceId, @UserAppointmentId, @ServiceId, @ExpectTime)";
            int status = this._connection.Execute(query, model, transaction);
            return status > 0;
        }
        public bool UpdateTotalAmountAppointmentService(UserAppointment model, IDbTransaction transaction = null)
        {
            string query = "UPDATE [dbo].[user_appointment] SET [TotalAmount] = @TotalAmount WHERE UserAppointmentId = @UserAppointmentId";
            int status = this._connection.Execute(query, model, transaction);
            return status > 0;
        }
        public UserAppointment GetUserAppointmentById(string userAppointmentId, IDbTransaction transaction = null)
        {
            string query = "select * from [dbo].[user_appointment] where UserAppointmentId=@userAppointmentId";
            return this._connection.Query<UserAppointment>(query, new { userAppointmentId }, transaction).FirstOrDefault();
        }

        public List<UserAppointmentService> GetAllServiceByUserAppointmentId(string UserAppointmentId, IDbTransaction transaction = null)
        {
            string query = "select * from [user_appointment_service] where UserAppointmentId = @UserAppointmentId";
            return this._connection.Query<UserAppointmentService>(query, new { UserAppointmentId }, transaction).ToList();
        }
        public bool DeleteServiceByUserAppointmentServiceId(string userAppointmentServiceId, IDbTransaction transaction = null)
        {
            string query = "delete from [user_appointment_service] where UserAppointmentServiceId=@userAppointmentServiceId";
            return this._connection.Execute(query, new { userAppointmentServiceId }, transaction) > 0;
        }
    }
}