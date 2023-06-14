using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class ReasonRejectService : BaseService
    {
        public ReasonRejectService() : base() { }

        public ReasonRejectService(IDbConnection db) : base(db) { }

        public bool InsertReasonReject(ReasonReject reasonReject, IDbTransaction transaction = null)
        {
            string query = "INSERT INTO [dbo].[reason_reject] ([ReasonRejectId],[UserAppointmentId],[Message],[CreateTime]) VALUES ( @ReasonRejectId, @UserAppointmentId, @Message, @CreateTime)";
            return _connection.Execute(query, reasonReject, transaction) > 0;
        }
        public ReasonReject GetReasonRejectById(string userAppointmentId, IDbTransaction transaction = null)
        {
            string query = "select * from reason_reject where UserAppointmentId=@userAppointmentId ";
            return _connection.Query<ReasonReject>(query, new { userAppointmentId }, transaction).FirstOrDefault();
        }
    }
}