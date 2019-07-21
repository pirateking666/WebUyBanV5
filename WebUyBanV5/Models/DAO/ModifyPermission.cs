using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebUyBanV5.Models.DAO
{
    public class ModifyPermission
    {
        public permission Insert(string name)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            permission p = new permission();
            p.Name = name;
            db.permissions.Add(p);
            db.SaveChanges();
            return p;
        }
        public int GetID_ByName(string name)
        {
            return new WebUyBanV5DBContext().permissions.SingleOrDefault(x => x.Name == name).ID;
        }
        public List<permission> GetList()
        {
            return new WebUyBanV5DBContext().permissions.OrderBy(x => x.ID).ToList();
        }
        public permission GetPerByID(int ID)
        {
            return new WebUyBanV5DBContext().permissions.SingleOrDefault(x => x.ID == ID);
        }
        public permission Update(int ID, string name)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            permission p = db.permissions.SingleOrDefault(x => x.ID == ID);
            p.Name = name;
            db.SaveChanges();
            return p;
        }
        public void Delete(int perID)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            permission p = db.permissions.SingleOrDefault(x => x.ID == perID);
            db.permissions.Remove(p);
            db.SaveChanges();
        }
        public bool Check_Permission(int perID, int dataactionID)
        {
            action_permission ap = new WebUyBanV5DBContext().action_permission.SingleOrDefault(x => x.permissionID == perID && x.dataactiontableID == dataactionID);
            if (ap == null)
                return false;
            else
                return true;
        }
    }
}