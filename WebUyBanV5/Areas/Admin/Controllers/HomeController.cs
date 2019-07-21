using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebUyBanV5.Areas.Admin.Models;
using WebUyBanV5.Common;
using WebUyBanV5.Models;
using WebUyBanV5.Models.DAO;

namespace WebUyBanV5.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            if (Session["user"] == null || Session["permission"] == null)
            {
                return RedirectToAction("Index", "Home", new { @area = "" });
            }

            ViewBag.ListPer = new ModifyData_Action_Table().GetListD();
            ViewBag.NumOfPer = new ModifyData_Action_Table().CountRecord();

            if (new ModifyPermission().Check_Permission((int)Session["permission"], 2))
            {
                ViewBag.ListPermission = new ModifyPermission().GetList();
            }
            ViewBag.ListPermissionDrop = new SelectList(new ModifyPermission().GetList(), "ID", "Name");

            ViewBag.ListUsername = new ModifyAccount().GetList_Username();

            if (new ModifyPermission().Check_Permission((int)Session["permission"], 14))
            {
                ViewBag.ListUser = new ModifyUser().GetList((int)Session["user"]);
            }
            ViewBag.NumOfUser = new ModifyUser().CountUser();
            return View();
        }
        public JsonResult Create_Per_Type(string name, string check_list)
        {
            if (!new ModifyPermission().Check_Permission(int.Parse(Session["permission"].ToString()), 1))
            {
                return Json("pe", JsonRequestBehavior.AllowGet);
            }
            permission p;
            try
            {
                p = new ModifyPermission().Insert(name);
            }
            catch (Exception)
            {
                return Json("w1", JsonRequestBehavior.AllowGet);
            }
            try
            {
                new ModifyAction_Permission().InsertMultiple(p.ID, check_list);
                return Json(p, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json("w2", JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult Load_Update_Per_Type(int perID)
        {
            if (!new ModifyPermission().Check_Permission(int.Parse(Session["permission"].ToString()), 3))
            {
                return Json("pe", JsonRequestBehavior.AllowGet);
            }
            var per = new ModifyPermission().GetPerByID(perID);
            var action_list = new ModifyAction_Permission().GetList_Action_Per_ByID(perID);
            return Json(new { name = per.Name, list = action_list }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update_Per_Type(int perID, string name, string check_list)
        {
            permission p;
            try
            {
                p = new ModifyPermission().Update(perID, name);
            }
            catch (Exception)
            {
                return Json("w1", JsonRequestBehavior.AllowGet);
            }
            try
            {
                new ModifyAction_Permission().UpdatePer_Multiple(perID, check_list);
                return Json(new { name = p.Name }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json("w2", JsonRequestBehavior.AllowGet);
            }
        }
        public JsonResult Delete_Per_Type(int perID)
        {
            if (!new ModifyPermission().Check_Permission(int.Parse(Session["permission"].ToString()), 4))
            {
                return Json("pe", JsonRequestBehavior.AllowGet);
            }
            if (new ModifyAccount().Count_Account_For_Per(int.Parse(Session["permission"].ToString())) == 0)
            {
                new ModifyAction_Permission().DeleteMultiple(perID);
                return Json("w2", JsonRequestBehavior.AllowGet);
            }
            else
            {
                try
                {
                    new ModifyPermission().Delete(perID);
                    return Json("t", JsonRequestBehavior.AllowGet);
                }
                catch (Exception)
                {
                    return Json("w1", JsonRequestBehavior.AllowGet);
                }
            }
        }
        public JsonResult Insert_User(PermisionManagerModel model)
        {
            account a;
            if (!new ModifyPermission().Check_Permission(int.Parse(Session["permission"].ToString()), 13))
            {
                return Json("pe", JsonRequestBehavior.AllowGet);
            }
            try
            {
                a = new ModifyAccount().Insert(model.um);
            }
            catch (Exception)
            {
                return Json("wa", JsonRequestBehavior.AllowGet);
            }
            try
            {
                new ModifyUser().Insert(model.um, int.Parse(Session["user"].ToString()), a.ID);
                user u = new ModifyUser().GetUser_ByAccID(a.ID);
                account anew = new ModifyAccount().GetAccountBy_ID(u.accountID);
                if (u.Email == null && u.Address == null)
                {
                    return Json(new
                    {
                        id = u.ID,
                        username = anew.Username,
                        firstname = u.FirstName,
                        lastname = u.LastName,
                        birth = u.Birth,
                        gender = u.Gender,
                        createday = u.CreateDay,
                        createby = u.user2.FirstName + " " + u.user2.LastName,
                        phone = u.Phone,
                        status = anew.Status,
                        permissionname = anew.permission.Name
                    }, JsonRequestBehavior.AllowGet);
                }
                else if (u.Email == null && u.Address != null)
                {
                    return Json(new
                    {
                        id = u.ID,
                        username = anew.Username,
                        firstname = u.FirstName,
                        lastname = u.LastName,
                        birth = u.Birth,
                        gender = u.Gender,
                        address = u.Address,
                        createday = u.CreateDay,
                        createby = u.user2.FirstName + " " + u.user2.LastName,
                        phone = u.Phone,
                        status = anew.Status,
                        permissionname = anew.permission.Name
                    }, JsonRequestBehavior.AllowGet);
                }
                else if (u.Email != null && u.Address == null)
                {
                    return Json(new
                    {
                        id = u.ID,
                        username = anew.Username,
                        firstname = u.FirstName,
                        lastname = u.LastName,
                        birth = u.Birth,
                        gender = u.Gender,
                        email = u.Email,
                        createday = u.CreateDay,
                        createby = u.user2.FirstName + " " + u.user2.LastName,
                        phone = u.Phone,
                        status = anew.Status,
                        permissionname = anew.permission.Name
                    }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new
                    {
                        id = u.ID,
                        username = anew.Username,
                        firstname = u.FirstName,
                        lastname = u.LastName,
                        birth = u.Birth,
                        gender = u.Gender,
                        email = u.Email,
                        address = u.Address,
                        createday = u.CreateDay,
                        createby = u.user2.FirstName + " " + u.user2.LastName,
                        phone = u.Phone,
                        status = anew.Status,
                        permissionname = anew.permission.Name
                    }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception)
            {
                return Json("wu", JsonRequestBehavior.AllowGet);
            }
        }
    }
}