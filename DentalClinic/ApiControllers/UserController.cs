﻿using DentalClinic.Models;
using DentalClinic.Providers;
using DentalClinic.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace DentalClinic.ApiControllers
{
    public class UserController : ApiBaseController
    {
        // GET: User
        [HttpGet]
        public JsonResult GetListUser()
        {
            UserService userService = new UserService();
            List<User> list = userService.GetListUser();
            return Success(list);
        }

        [HttpPost]
        public JsonResult Login(User model)
        {
            UserService userService = new UserService();

            if (string.IsNullOrEmpty(model.Account) || string.IsNullOrEmpty(model.Password)) throw new Exception("Email/Tên đăng nhập/Mật khẩu không được để trống.");

            User userLogin = userService.GetUserByUserName(model.Account);
            if (userLogin == null) throw new Exception("Người dùng này không tồn tại");

            if (userLogin.Enable == false) return Error("Tài khoản này đã bị khóa.");

            string password = SecurityProvider.EncodePassword(userLogin.UserId, model.Password);
            if (!userLogin.Password.Equals(password)) throw new Exception("Email/Tên đăng nhập/Mật khẩu không được để trống.");

            return Success();

        }

        [HttpPost]
        public JsonResult Register(User model)
        {
            try
            {
                using (var connect = BaseService.Connect())
                {
                    connect.Open();
                    using (var transaction = connect.BeginTransaction())
                    {
                        UserService userService = new UserService(connect);

                        if (string.IsNullOrEmpty(model.Name)) throw new Exception("Họ và tên người dùng không được để trống.");
                        if (string.IsNullOrEmpty(model.Account) || userService.CheckDuplicateUser(model.Account, transaction) != null) throw new Exception("Tên đăng nhập không được để trống.");
                        if (string.IsNullOrEmpty(model.Email) || userService.CheckDuplicateUser(model.Email, transaction) != null) throw new Exception("Email không được để trống.");
                        if (string.IsNullOrEmpty(model.Password)) throw new Exception("Password không được để trống.");

                        User user = new User();
                        user.UserId = Guid.NewGuid().ToString();
                        user.Name = model.Name;
                        user.Account = model.Account;
                        user.Email = model.Email;
                        user.Password = SecurityProvider.EncodePassword(user.UserId, model.Password);
                        user.Enable = true;
                        DateTime now = DateTime.Now;
                        user.CreateTime = HelperProvider.GetSeconds(now);

                        if (!userService.InsertNewUser(user, transaction)) throw new Exception(JsonResult.Message.ERROR_SYSTEM);

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
