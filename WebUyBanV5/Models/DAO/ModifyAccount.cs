using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebUyBanV5.Areas.Admin.Models;
using WebUyBanV5.Common;

namespace WebUyBanV5.Models.DAO
{
    public class ModifyAccount
    {
        public account Insert(UserModel model)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            account a = new account();
            a.Username = model.username;
            a.Password = new SHA256_Hash().Hash_Function(model.password);
            a.Status = 1;
            a.permissionID = model.permissionID;
            db.accounts.Add(a);
            db.SaveChanges();
            return a;
        }
        public string GetList_Username()
        {
            string s = "";
            List<account> ls = new WebUyBanV5DBContext().accounts.ToList();
            for (int i = 0; i < ls.Count; i++)
            {
                if (i == 0)
                {
                    s += ls[i].Username;
                }
                else
                {
                    s += "-" + ls[i].Username;
                }
            }
            return s;
        }
        public int VerifyLogin(string use, string pas) {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            account a = db.accounts.SingleOrDefault(x => x.Username == use);
            if(a == null)
            {
                return 0;
            }
            else
            {
                 if(a.Password != new SHA256_Hash().Hash_Function(pas))
                {
                    return -1;
                }
                 else
                {
                    return 1;
                }
            }
        }
        public int GetPerIDBy_Use_Pass(string use)
        {
            account a = new WebUyBanV5DBContext().accounts.SingleOrDefault(x => x.Username == use);
            return a.permissionID;
        }
        public int GetIDBy_Use_Pass(string use)
        {
            account a = new WebUyBanV5DBContext().accounts.SingleOrDefault(x => x.Username == use);
            return a.ID;
        }
        public account GetAccountBy_ID(int ID)
        {
            return new WebUyBanV5DBContext().accounts.SingleOrDefault(x => x.ID == ID);
        }
        public int Count_Account_For_Per(int ID)
        {
            return new WebUyBanV5DBContext().accounts.Where(x => x.permissionID == ID).ToList().Count;
        }
    }
}