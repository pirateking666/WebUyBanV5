using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebUyBanV5.Models.DAO;

namespace WebUyBanV5.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult Login(string username, string password)
        {
            int check = new ModifyAccount().VerifyLogin(username, password);
            if (check == 0)
            {
                return Json("w1", JsonRequestBehavior.AllowGet);
            }
            else if(check == -1)
            {
                return Json("w2", JsonRequestBehavior.AllowGet);
            }
            else
            {
                int useID = new ModifyUser().GetUserIDBy_User_Pass(username);
                int perID = new ModifyAccount().GetPerIDBy_Use_Pass(username);
                Session["user"] = useID;
                Session["permission"] = perID;
                return Json("", JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Logout()
        {
            Session.Abandon();
            Session.Clear();
            return View("Index");
        }
    }
}