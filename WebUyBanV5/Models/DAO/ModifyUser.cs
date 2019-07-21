using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebUyBanV5.Areas.Admin.Models;
using WebUyBanV5.Common;

namespace WebUyBanV5.Models.DAO
{
    public class ModifyUser
    {
        public List<UserModel> GetList(int uID)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            return db.users.Select(x => new UserModel { userID = x.ID,
                FirstName = x.FirstName,
                LastName = x.LastName,
                Birth = x.Birth,
                Gender = x.Gender,
                Phone = x.Phone,
                Email = x.Email,
                Address = x.Address,
                CreateDay = x.CreateDay,
                CreateByName = x.user2.FirstName + " " + x.user2.LastName,
                username = x.account.Username,
                Status = x.account.Status,
                permissionName = x.account.permission.Name }).Where(x => x.userID != uID).ToList();
        }
        public void Insert(UserModel model, int userID, int accID)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            user u = new user();
            u.FirstName = model.FirstName;
            u.LastName = model.LastName;
            u.Phone = model.Phone;
            u.Gender = model.Gender;
            u.Birth = model.Birth;
            u.CreateDay = DateTime.Now;
            u.CreateBy = userID;
            u.accountID = accID;
            if (model.Address != null)
            {
                u.Address = model.Address;
            }
            if (model.Email != null)
            {
                u.Email = model.Email;
            }
            db.users.Add(u);
            db.SaveChanges();
        }
        public int GetUserIDBy_User_Pass(string use)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            user u = db.users.SingleOrDefault(x => x.account.Username == use);
            return u.ID;
        }
        public user GetUser_ByAccID(int ID)
        {
            return new WebUyBanV5DBContext().users.SingleOrDefault(x => x.account.ID == ID);
        }
        public int CountUser()
        {
            return new WebUyBanV5DBContext().users.ToList().Count;
        }
    }
}