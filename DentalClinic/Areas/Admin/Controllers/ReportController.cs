using DentalClinic.Models;
using DentalClinic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentalClinic.Areas.Admin.Controllers
{
    public class ReportController : Controller
    {
        // GET: Admin/Report
        public ActionResult Index()
        {
            var doctorService = new DoctorService();
            var userAppService = new UserMakeAppointmentService();
            ViewBag.ListDoctor = doctorService.GetListDoctor();
            ViewBag.ListUser = userAppService.GetUserAppointments();

            return View();
        }
    }
}