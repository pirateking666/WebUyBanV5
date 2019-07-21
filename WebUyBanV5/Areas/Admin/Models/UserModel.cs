using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebUyBanV5.Areas.Admin.Models
{
    public class UserModel
    {
        public int userID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime Birth { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public DateTime CreateDay { get; set; }
        public int? CreateBy { get; set; }
        public string CreateByName { get; set; }
        public int accountID { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string confirm_pass { get; set; }
        public int Status { get; set; }
        public int permissionID { get; set; }
        public string permissionName { get; set; }
    }
}