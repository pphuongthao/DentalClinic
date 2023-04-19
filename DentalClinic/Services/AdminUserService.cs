using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class AdminUserService : BaseService
    {
        public AdminUserService() : base() { }
        public AdminUserService(IDbConnection db) : base(db) { }
        public UserListViewModel GetListUser(int page, string keyword, IDbTransaction transaction = null)
        {
            UserListViewModel userListViewModel = new UserListViewModel();
            userListViewModel.ListUser = new List<User>();
            userListViewModel.TotalPage = 0;

            string querySelect = "select u.UserId, u.Name, u.Avatar, u.Account, u.Email, u.Phone, u.CreateTime, u.Enable, u.SearchName";
            string queryCount = "select count(*) as Total ";
            string query = " from [user] u";

            if (!string.IsNullOrEmpty(keyword))
            {
                keyword = "%" + keyword.Replace(' ', '%') + "%";
                query += " where SearchName like @keyword or Account like @keyword or Email like @keyword or Phone like @keyword";
            }

            int totalRow = _connection.Query<int>(queryCount + query, new { keyword = keyword }, transaction).FirstOrDefault();
            if (totalRow > 0)
            {
                userListViewModel.TotalPage = (int)Math.Ceiling((decimal)totalRow / Constant.ADMIN_PAGE_SIZE);
            }

            int skip = (page - 1) * Constant.ADMIN_PAGE_SIZE;
            query += " order by u.CreateTime desc offset " + skip + " rows fetch next " + Constant.ADMIN_PAGE_SIZE + " rows only";
            userListViewModel.ListUser = this._connection.Query<User>(querySelect + query, new { keyword = keyword }, transaction).ToList();
            return userListViewModel;
        }

        public User GetUserById(string id, IDbTransaction transaction = null)
        {
            string query = "select u.UserId, u.Name, u.Avatar, u.Account, u.Email, u.Phone, u.CreateTime, u.Enable from [user] u where UserId = @id";
            return _connection.Query<User>(query, new { id }, transaction).FirstOrDefault();
        }

        public bool CheckAccountExist(string account, string userId, IDbTransaction transaction = null)
        {
            string query = "select count(*) from [user] where Account = @account and Account <> '' and UserId <> @userId";
            int count = this._connection.Query<int>(query, new { account = account, userId = userId }, transaction).FirstOrDefault();
            return count > 0;
        }
        public bool CheckEmailExit(string email, string userId, IDbTransaction transaction = null)
        {
            string query = "select count(*) from [user] where Email = @email and Email <> '' and UserId <> @userId";
            int count = this._connection.Query<int>(query, new { email = email, userId = userId }, transaction).FirstOrDefault();
            return count > 0;
        }
        public bool InsertUser(User user, IDbTransaction transaction = null)
        {
            string query = "INSERT INTO [user] (UserId, Name, Avatar, Account, Email, Password, CreateTime, Enable, SearchName)"
                + "VALUES (@UserId, @Name, @Avatar, @Account, @Email, @Password, @CreateTime, @Enable, @SearchName)";
            return _connection.Execute(query, user, transaction) > 0;
        }

        public bool UpdateUser(User user, IDbTransaction transaction = null)
        {
            string query = "UPDATE [user] SET Name = @Name, Avatar = @Avatar, Account = @Account, Email = @Email, Phone = @Phone, Password = @Password, CreateTime = @CreateTime, SearchName = @SearchName WHERE UserId = @UserId";
            return _connection.Execute(query, user, transaction) > 0;
        }
        public bool ChangeUserEnable(string id, IDbTransaction transaction = null)
        {
            string query = "UPDATE [user] SET Enable = 0 WHERE UserId = @id";
            return _connection.Execute(query, new { id }, transaction) > 0;
        }
    }
}