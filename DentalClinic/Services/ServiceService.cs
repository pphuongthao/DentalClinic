using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class ServiceService : BaseService
    {
        public ServiceService() : base() { }
        public ServiceService(IDbConnection db) : base(db) { }

        public List<ServiceDental> GetListService()
        {
            string query = "select * from [service]";
            return this._connection.Query<ServiceDental>(query).ToList();
        }
        public List<ServiceDental> GetListServiceForHomePage(IDbTransaction transaction = null)
        {
            string query = "select TOP(10) * from [service]";
            return this._connection.Query<ServiceDental>(query, transaction).ToList();
        }
        public ServiceDental GetServiceById(string ServiceId, IDbTransaction transaction = null)
        {
            string query = "select * from [service] where ServiceId = @ServiceId";
            return this._connection.Query<ServiceDental>(query, new { ServiceId }, transaction).FirstOrDefault();
        }
        public List<ServiceDental> GetServiceByUserAppointmentId(string UserAppointmentId, IDbTransaction transaction = null)
        {
            string query = "select s.* from [user_appointment_service] uas right join [service] s on uas.ServiceId = s.ServiceId where uas.UserAppointmentId = @UserAppointmentId";
            return this._connection.Query<ServiceDental>(query, new { UserAppointmentId }, transaction).ToList();
        }
    }
}