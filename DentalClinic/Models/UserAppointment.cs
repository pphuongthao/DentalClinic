using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DentalClinic.Models
{
    public class UserAppointment
    {
        public string UserAppointmentId { get; set; }
        public string UserId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string DoctorId { get; set; }
        public int Hour { get; set; }
        public int Minute { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public string Status { get; set; }
        public long CreateTime { get; set; }
        public class EnumStatus
        {
            public const string PENDING = "PENDING";
            public const string DONE = "DONE";
            public const string USER_CANCEL = "USER_CANCEL";
            public const string SYSTEM_CANCEL = "SYSTEM_CANCEL";
        }
    }

    public class UserAppointmentRequest : UserAppointment
    {
        public List<UserAppointmentService> ListService { get; set; }
    }
}