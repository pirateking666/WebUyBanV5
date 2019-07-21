using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebUyBanV5.Areas.Admin.Models;

namespace WebUyBanV5.Models.DAO
{
    public class ModifyData_Action_Table
    {
        public List<data_action_table> GetListD()
        {
            return new WebUyBanV5DBContext().data_action_table.ToList();
        }
        public int CountRecord()
        {
            return new WebUyBanV5DBContext().data_action_table.ToList().Count;
        }
    }
}