using DentalClinic.Filters;
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
    [Permission(Permissions = "ADMIN")]
    public class ManageUserController : ApiAdminBaseController
    {
        [HttpGet]
        [APIAdminToken]
        public JsonResult GetListUser(int? page, string keyword = "")
        {
            try
            {
                AdminUserService adminUserService = new AdminUserService();
                if (!page.HasValue) page = 1;
                return Success(adminUserService.GetListUser(page.Value, keyword));
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

        [HttpGet]
        public JsonResult SearchUser(string keyword)
        {
            try
            {
                UserService userService = new UserService();
                return Success(userService.GetListSearchUser(keyword));
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
        [HttpGet]
        [APIAdminToken]
        public JsonResult GetUserAdminById(string id)
        {
            try
            {
                AdminUserService adminUserService = new AdminUserService();
                return Success(adminUserService.GetUserById(id));
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
        [HttpPost]
        [APIAdminToken]
        public JsonResult InsertUser(User model)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        AdminUserService adminUserService = new AdminUserService(connect);
                        User user = new User();
                        user.UserId = Guid.NewGuid().ToString();
                        user.Name = model.Name;
                        if (string.IsNullOrEmpty(user.Name)) throw new Exception("Tên người dùng không được để trống.");
                        user.SearchName = HelperProvider.RemoveUnicode(model.Name);

                        user.Account = model.Account;
                        if (string.IsNullOrEmpty(user.Account)) throw new Exception("Tên đăng nhập không được để trống.");
                        if (adminUserService.CheckAccountExist(user.Account, user.UserId, transaction)) throw new Exception("Tên đăng nhập đã tồn tại.");

                        user.Email = model.Email.Trim();
                        if (adminUserService.CheckEmailExit(user.Email, user.UserId, transaction)) throw new Exception("Email đã tồn tại.");

                        if (string.IsNullOrEmpty(model.Password)) throw new Exception("Mật khẩu không được để trống.");
                        user.Password = SecurityProvider.EncodePassword(user.UserId, SecurityProvider.CreateMD5(SecurityProvider.Base64Encode(model.Password)));

                        user.CreateTime = HelperProvider.GetSeconds();
                        user.Enable = true;
                        if (!string.IsNullOrEmpty(model.Avatar))
                        {
                            string filename = Guid.NewGuid().ToString() + ".jpg";
                            var path = System.Web.HttpContext.Current.Server.MapPath(Constant.PRODUCT_THUMBNAIL_PATH + filename);
                            HelperProvider.Base64ToImage(model.Avatar, path);
                            user.Avatar = Constant.PRODUCT_THUMBNAIL_URL + filename;
                        }
                        if (!adminUserService.InsertUser(user, transaction)) throw new Exception(JsonResult.Message.ERROR_SYSTEM);
                        transaction.Commit();
                        return Success();
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }

        }
        [HttpPost]
        [APIAdminToken]
        public JsonResult UpdateUserInfo(User model)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        AdminUserService adminUserService = new AdminUserService(connect);
                        User user = adminUserService.GetUserById(model.UserId, transaction);
                        if (user == null) throw new Exception("Tài khoản này không tồn tại.");

                        user.Name = model.Name;
                        if (string.IsNullOrEmpty(user.Name)) throw new Exception("Tên người dùng không được để trống.");
                        user.SearchName = HelperProvider.RemoveUnicode(model.Name);

                        user.Account = model.Account;
                        if (string.IsNullOrEmpty(user.Account)) throw new Exception("Tên đăng nhập không được để trống.");
                        if (adminUserService.CheckAccountExist(user.Account, user.UserId, transaction)) throw new Exception("Tên đăng nhập đã tồn tại.");

                        user.Email = model.Email.Trim();
                        if (adminUserService.CheckEmailExit(user.Email, user.UserId, transaction)) throw new Exception("Email đã tồn tại.");

                        user.Phone = model.Phone;

                        if (!string.IsNullOrEmpty(model.Password))
                        {
                            user.Password = SecurityProvider.EncodePassword(user.UserId, SecurityProvider.CreateMD5(SecurityProvider.Base64Encode(model.Password)));
                        }


                        user.CreateTime = HelperProvider.GetSeconds();

                        if (!string.IsNullOrEmpty(model.Avatar))
                        {
                            if (!HelperProvider.DeleteFile(user.Avatar)) throw new Exception(JsonResult.Message.ERROR_SYSTEM);

                            string filename = Guid.NewGuid().ToString() + ".jpg";
                            var path = System.Web.HttpContext.Current.Server.MapPath(Constant.PRODUCT_THUMBNAIL_PATH + filename);
                            HelperProvider.Base64ToImage(model.Avatar, path);
                            user.Avatar = Constant.PRODUCT_THUMBNAIL_URL + filename;
                        }
                        if (!adminUserService.UpdateUser(user, transaction)) throw new Exception(JsonResult.Message.ERROR_SYSTEM);
                        transaction.Commit();
                        return Success();
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }
        /// <summary>
        /// Chuyển trạng thái cho người dùng
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        [APIAdminToken]
        public JsonResult ChangeUserEnable(string id)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        AdminUserService adminUserService = new AdminUserService(connect);
                        User user = adminUserService.GetUserById(id, transaction);
                        if (user == null) throw new Exception("Tài khoản này không tồn tại");

                        if (!adminUserService.ChangeUserEnable(id, transaction)) throw new Exception(JsonResult.Message.ERROR_SYSTEM);
                        transaction.Commit();
                        return Success();
                    }
                }
            }
            catch (Exception ex)
            {
                return Error(ex.Message);
            }
        }

    }
}
