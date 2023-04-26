using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class UserAppointmentService : BaseService
    {
        public UserAppointmentService() : base() { }
        public UserAppointmentService(IDbConnection db) : base(db) { }
       
    }
}