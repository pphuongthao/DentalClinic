using Dapper;
using DentalClinic.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DentalClinic.Services
{
    public class UserService :BaseService
    {
        public UserService() : base() { }
        public UserService(IDbConnection db) : base(db) { }
        public List<User> GetListUser(IDbTransaction transaction = null)
        {
            string query = "select [UserId],[Name],[Avatar],[Account],[Email],[Phone] from [user]";
            return this._connection.Query<User>(query, null, transaction).ToList();
        }
        public List<User> GetListUserActive(IDbTransaction transaction = null)
        {
            string query = "select [UserId],[Name],[Avatar],[Account],[Email],[Phone] from [user] where Enable = 1";
            return this._connection.Query<User>(query, null, transaction).ToList();
        }
        public User GetUserById(string UserId, IDbTransaction transaction = null)
        {
            string query = "select [UserId],[Name], [Avatar], [Account],[Email], [Phone], [CreateTime], [Enable] from [user] where UserId = @UserId";
            return this._connection.Query<User>(query, new { UserId }).FirstOrDefault();
        }
        public User GetUserByAccountOrPhone(UserLoginModel model, IDbTransaction transaction = null)
        {
            string query = "select top 1 * from [user] where Account=@Account or Phone=@Phone";
            return this._connection.Query<User>(query, model, transaction).FirstOrDefault();
        }
        public User GetUserByAccount(string Account)
        {
            string phone = Account.Replace(" ", "");
            if (phone.Length > 9)
                phone = "0" + phone.Substring(phone.Length - 9, 9);
            string query = "select * from [user] where Account = @Account or Phone = @phone";
            return this._connection.Query<User>(query, new { Account, phone }).FirstOrDefault();
        }
        public User GetUserByPhone(string phone)
        {
            string query = "select top 1 * from [user] where Phone=@phone";
            return this._connection.Query<User>(query, new { phone }).FirstOrDefault();
        }
        public User GetUserByToken(string Token, IDbTransaction transaction = null)
        {
            string query = "select u.* from [user] u join [user_token] ut on u.UserId = ut.UserId where ut.Token = @Token";
            return this._connection.Query<User>(query, new { Token }, transaction).FirstOrDefault();
        }
        public UserToken GetTokenByUserId(string userId, IDbTransaction transaction = null)
        {
            string query = "select * from [user_token] where UserId = @userId";
            return this._connection.Query<UserToken>(query, new { userId }, transaction).FirstOrDefault();
        }
        public UserToken GetTokenByToken(string token, IDbTransaction transaction = null)
        {
            string query = "select top 1 * from [user_token] where Token = @token";
            return this._connection.Query<UserToken>(query, new { token }, transaction).FirstOrDefault();
        }
        public List<string> GetListUserConnection(string userId, IDbTransaction transaction = null)
        {
            string query = "select ConnectionId from user_token where UserId=@userId and ConnectionId is not null and ConnectionId<>''";
            return this._connection.Query<string>(query, new { userId }, transaction).ToList();
        }

        public bool RemoveConnection(string connectionId, IDbTransaction transaction = null)
        {
            string query = "update user_token set ConnectionId = '' where ConnectionId=@connectionId";
            return this._connection.Execute(query, new { connectionId }, transaction) > 0;
        }

        public bool UpdatePassword(string UserId, string newPassword, string OldPassword, IDbTransaction transaction = null)
        {
            string update = "UPDATE [user] SET Password = @newPassword WHERE UserId = @userId and Password = @OldPassword";
            int status = this._connection.Execute(update, new { newPassword, UserId, OldPassword }, transaction);
            return status > 0;
        }
        public bool UpdatePassword(string UserId, string newPassword, IDbTransaction transaction = null)
        {
            string update = "UPDATE [user] SET Password = @newPassword WHERE UserId = @userId ";
            int status = this._connection.Execute(update, new { newPassword, UserId }, transaction);
            return status > 0;
        }
        public bool InsertToken(UserToken model)
        {
            string query = "INSERT INTO [dbo].[user_token] ([UserTokenId],[UserId],[Token],[CreateTime],[FireBaseToken]) VALUES (@UserTokenId,@UserId,@Token,@CreateTime,@FireBaseToken)";
            return this._connection.Execute(query, model) > 0;
        }
        public bool UpdateConnectionId(UserToken model)
        {
            string query = "update [user_token] set ConnectionId=@ConnectionId where UserTokenId=@UserTokenId";
            return this._connection.Execute(query, model) > 0;
        }
        public bool DeleteToken(string UserId)
        {
            string query = "delete from [user_token] where UserId = @UserId";
            return this._connection.Execute(query, new { UserId }) > 0;
        }
        public bool InsertNewUser(User user, IDbTransaction transaction = null)
        {
            string query = "insert into [user] ([UserId],[Name],[Account],[Email],[Phone],[Password],[Enable], [SearchName]) values (@UserId, @Name, @Account, @Email, @Phone, @Password,@Enable, @SearchName)";
            var status = this._connection.Execute(query, user, transaction);
            return status > 0;
        }

        public string CheckDuplicateUser(string Keyword, IDbTransaction transaction = null)
        {
            string query = "select * from [user] where Phone = @Keyword or Account = @Keyword";
            return this._connection.Query<string>(query, new { Keyword }, transaction).FirstOrDefault();
        }

        public bool CheckPhoneExist(string phone, IDbTransaction transaction = null)
        {
            string query = "select count(*) from [user] where Phone = @phone and Phone <> '' ";
            int count = this._connection.Query<int>(query, new { phone }, transaction).FirstOrDefault();
            return count > 0;
        }

        public bool CheckAccountExist(string account, IDbTransaction transaction = null)
        {
            string query = "select count(*) from [user] where Account = @account and Account <> ''";
            int count = this._connection.Query<int>(query, new { account }, transaction).FirstOrDefault();
            return count > 0;
        }

        public bool UpdateUser(User model, IDbTransaction transaction = null)
        {
            string update = "UPDATE [dbo].[user] SET [Name] = @Name, [Avatar] = @Avatar,[Account] = @Account," +
                            "[Email] = @Email, [ShareCode] = @ShareCode,[ParentCode] = @ParentCode, [SearchName] = @SearchName WHERE [UserId] = @UserId";
            int status = this._connection.Execute(update, model, transaction);
            return status > 0;
        }

        public bool UpdateEmail(string NewEmail, string UserId, IDbTransaction transaction = null)
        {
            string query = "update [user] set Email = @NewEmail where UserId = @UserId";
            return this._connection.Execute(query, new { NewEmail, UserId }, transaction) > 0;
        }

        public User GetUserByEmailOrPhone(string Keyword)
        {
            string query = "select [UserId], [Name], [Avatar], [Account], [ShareCode], [ParentCode], [Email], [Phone], [CreateTime], [Enable] from [user] where Email = @Keyword or Phone = @Keyword";
            return this._connection.Query<User>(query, new { Keyword }).FirstOrDefault();
        }

        public string CheckDuplicateEmail(string Email)
        {
            string query = "select Name from [user] where Email = @Email";
            return this._connection.Query<string>(query, new { Email }).FirstOrDefault();
        }

        public CodeConfirm CheckDuplicateOTP(string OTP)
        {
            //long PresentTime = HelperProvider.GetSeconds();
            string query = $"select * from [code_confirm] cc where cc.Code = {OTP}";
            return this._connection.Query<CodeConfirm>(query, new { OTP }).FirstOrDefault();
        }

        public CodeConfirm CheckDuplicateCodeAndPhone(string Phone, string OTP)
        {
            string query = "select top 1 * from [code_confirm] where Phone = @Phone and Code = @OTP order by CreateTime desc";
            return this._connection.Query<CodeConfirm>(query, new { Phone, OTP }).FirstOrDefault();
        }

        public string CheckDuplicatePhone(string Phone)
        {
            string query = $"select Name from [user] where Phone = '{Phone}'";
            return this._connection.Query<string>(query, new { Phone }).FirstOrDefault();
        }

        public List<CodeConfirm> GetLimitOfOTPRequest(string Phone, long PresentTime)
        {
            string query = $"select Phone from [code_confirm] where Phone = '{Phone}' and CreateTime > ({PresentTime} - 86400000)";
            return this._connection.Query<CodeConfirm>(query, new { Phone, PresentTime }).ToList();
        }

        public bool UpdatePhone(string NewPhone, string UserId, IDbTransaction transaction = null)
        {
            string query = "update [user] set Phone = @NewPhone where UserId = @UserId";
            return this._connection.Execute(query, new { NewPhone, UserId }, transaction) > 0;
        }
        public List<object> GetListUserOnlineInfo(IDbTransaction transaction = null)
        {
            string query = "select u.UserId,u.Name,u.Avatar from [user_token] ut join [user] u on ut.UserId=u.UserId where ut.ConnectionId is not null and ut.ConnectionId<>'' group by u.UserId,u.Name,u.Avatar";
            return this._connection.Query<object>(query, null, transaction).ToList();
        }
        public List<object> GetListUserOnlineInfo(List<string> listUserId, IDbTransaction transaction = null)
        {
            string query = "select UserId,Name,Avatar from [user] where UserId in @listUserId";
            return this._connection.Query<object>(query, new { listUserId }, transaction).ToList();
        }
        public List<UserToken> GetListUserToken(string userId, IDbTransaction transaction = null)
        {
            string query = "select * from [user_token] where UserId=@userId";
            return this._connection.Query<UserToken>(query, new { userId }, transaction).ToList();
        }

        public List<object> GetListSearchUser(string keyword)
        {
            keyword = keyword.Trim();
            keyword = "%" + keyword.Replace(" ", "%") + "%";
            string query = "select top 10 * from [user] where Account like @keyword or Phone like @keyword";
            return this._connection.Query<object>(query, new { keyword }).ToList();
        }
    }
}