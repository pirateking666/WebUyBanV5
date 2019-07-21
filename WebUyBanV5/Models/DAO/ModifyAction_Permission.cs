using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebUyBanV5.Models.DAO
{
    public class ModifyAction_Permission
    {
        public int InsertMultiple(int per_id, string list_action)
        {
            try
            {
                string[] s = list_action.Split('-');
                for (int i = 0; i < s.Length; i++)
                {
                    Insert(per_id, int.Parse(s[i]));
                }
                return 1;
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public void Insert(int perID, int actionID)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            action_permission ap = new action_permission();
            ap.permissionID = perID;
            ap.dataactiontableID = actionID;
            db.action_permission.Add(ap);
            db.SaveChanges();
        }
        public string GetList_Action_Per_ByID(int perID)
        {
            string s = "";
            List<action_permission> ls = new WebUyBanV5DBContext().action_permission.Where(x => x.permissionID == perID).ToList();
            for (int i = 0; i < ls.Count; i++)
            {
                if (i == 0)
                {
                    s += ls[i].dataactiontableID;
                }
                else
                {
                    s += "-" + ls[i].dataactiontableID;
                }
            }
            return s;
        }
        public void UpdatePer_Multiple(int perID, string action_list)
        {
            List<action_permission> ls = new WebUyBanV5DBContext().action_permission.Where(x => x.permissionID == perID).ToList();
            string[] s = action_list.Split('-');
            //delete record
            for (int i = 0; i < ls.Count; i++)
            {
                int count = 0;
                for (int j = 0; j < s.Length; j++)
                {
                    if (ls[i].dataactiontableID == int.Parse(s[j]))
                    {
                        count++;
                    }
                    else
                        continue;
                }
                if(count == 0)
                {
                    Delete(perID, ls[i].dataactiontableID);
                }
            }
            //add record
            for (int i = 0; i < s.Length; i++)
            {
                int count = 0;
                for (int j = 0; j < ls.Count; j++)
                {
                    if (int.Parse(s[i]) == ls[j].dataactiontableID)
                    {
                        count++;
                    }
                    else
                        continue;
                }
                if(count == 0)
                {
                    Insert(perID, int.Parse(s[i]));
                }
            }
        }
        public void Delete(int perID, int actionID)
        {
            WebUyBanV5DBContext db = new WebUyBanV5DBContext();
            action_permission ap = db.action_permission.SingleOrDefault(x => x.permissionID == perID && x.dataactiontableID == actionID);
            db.action_permission.Remove(ap);
            db.SaveChanges();
        }
        public void DeleteMultiple(int perID)
        {
            List<action_permission> ls = new WebUyBanV5DBContext().action_permission.Where(x => x.permissionID == perID).ToList();
            for (int i = 0; i < ls.Count; i++)
            {
                Delete(perID, ls[i].dataactiontableID);
            }
        }
    }
}