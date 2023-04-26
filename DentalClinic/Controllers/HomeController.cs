using DentalClinic.Models;
using DentalClinic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentalClinic.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            // Danh sách 10 tin tức mới nhất
            NewsService newsService = new NewsService();
            List<News> lsnewsUpdates = newsService.GetListNewsForHomePage();
            ViewBag.ListNews = lsnewsUpdates;
            return View();
        }
        [Route("gioi-thieu")]
        public ActionResult About()
        {
            SystemAboutService systemAboutService = new SystemAboutService();
            SystemAbout systemAbout = systemAboutService.GetSystemAbout();
            ViewBag.SystemAbout = systemAbout;
            return View();
        }
        [Route("bac-si")]
        public ActionResult Doctors()
        {
            return View();
        }
        [Route("lien-he")]
        public ActionResult Contact()
        {
            return View();
        }
        [Route("dang-nhap")]
        public ActionResult LogIn()
        {
            return View();
        }
        [Route("dang-ky")]
        public ActionResult Register()
        {
            return View();
        }
        [Route("dat-lich-hen")]
        public ActionResult GetAppointment()
        {
            return View();
        }
        [Route("lich-hen-user")]
        public ActionResult UserAppointment()
        {
            return View();
        }

    }
}