﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DentalClinic.Areas.Admin.Controllers
{
    public class ManageUserController : Controller
    {
        // GET: Admin/ManageUser
        public ActionResult Index()
        {
            return View();
        }
    }
}