using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DentalClinic.Models
{
    public class ReasonReject
    {
        public string ReasonRejectId { get; set; }
        public string UserAppointmentId { get; set; }
        public string Message { get; set; }
        public long CreateTime { get; set; }
    }
    
}