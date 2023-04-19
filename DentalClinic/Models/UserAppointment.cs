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
        public string DoctorId { get; set; }
        public int Hour { get; set; }
        public int Minute { get; set; }
        public int Day { get; set; }
        public int Month { get; set; }
        public int Year { get; set; }
        public string Status { get; set; }
        public long CreateTime { get; set; }
    }
}