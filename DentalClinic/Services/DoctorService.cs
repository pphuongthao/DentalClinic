using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class DoctorService : BaseService
    {
        public DoctorService() : base() { }
        public DoctorService(IDbConnection db) : base(db) { }
        public List<Doctor> GetListDoctorForHomePage(IDbTransaction transaction = null)
        {
            string query = "select TOP(10) * from doctor Where Enable = 1 order by CreateTime DESC";
            return this._connection.Query<Doctor>(query, new { enable = true }, transaction).ToList();
        }
        public List<Doctor> GetListDoctor()
        {
            string query = "select * from doctor where Enable = 1";
            return this._connection.Query<Doctor>(query).ToList();
        }

        public Doctor GetDoctorById(string DoctorId, IDbTransaction transaction = null)
        {
            string query = "select * from doctor where DoctorId = @DoctorId";
            return this._connection.Query<Doctor>(query, new { DoctorId }, transaction).FirstOrDefault();
        }
    }
}