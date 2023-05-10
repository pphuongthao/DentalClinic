using DentalClinic.Models;
using DentalClinic.Providers;
using DentalClinic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace DentalClinic.Areas.Admin.ApiControllers
{
    public class AdminManageAppointmentController : ApiAdminBaseController
    {
        [HttpGet]
        public JsonResult GetListUserAppointment()
        {
            try
            {
                AdminManageAppointmentService adminManageAppointmentService = new AdminManageAppointmentService();
                return Success(adminManageAppointmentService.GetListUserAppointment());
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }


        [HttpGet]
        [ApiAdminTokenRequire]
        public JsonResult GetListAppointmentOfUser(string UserId, int PageIndex, string AppointmentCode = "", long? CreateStart = null, long? CreateEnd = null)
        {
            try
            {
                UserAdmin userAdmin = SecurityProvider.GetUserAdminByToken(Request);
                if (userAdmin == null) return Unauthorized();

                AdminManageAppointmentService adminManageAppointmentService = new AdminManageAppointmentService();
                ListUserAppointmentView listUserAppointmentView = adminManageAppointmentService.GetListAppointmentOfUser(UserId, PageIndex, AppointmentCode, CreateStart, CreateEnd);
                for (int i = 0; i < listUserAppointmentView.ListUserAppointmentInfor.Count; i++)
                {
                    var item = listUserAppointmentView.ListUserAppointmentInfor[i];
                    List<ServiceDental> lsServiceDental = adminManageAppointmentService.GetServiceByUserAppointmentId(item.UserAppointmentId);
                    decimal totalPriceService = 0;
                    foreach (var _item in lsServiceDental)
                    {
                        totalPriceService += _item.Price;
                    }
                    item.lsServiceDental = new List<ServiceDental>();
                    item.lsServiceDental.AddRange(lsServiceDental);
                    item.TotalAmount = totalPriceService;
                }
                return Success(listUserAppointmentView);
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
    }

}
