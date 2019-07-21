using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebUyBanV5.Models;

namespace WebUyBanV5.Areas.Admin.Models
{
    public class PermisionManagerModel
    {
        public permission per { get; set; }
        public action_permission acp { get; set; }
        public UserModel um { get; set; }
        public permission per_u { get; set; }
        public action_permission acp_u { get; set; }
        public UserModel um_u { get; set; }
    }
}