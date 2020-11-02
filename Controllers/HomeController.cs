using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;
using System.Web.Security;
using TravelProject.Helper;

namespace TravelProject.Controllers
{
    public class HomeController : Controller
    {
        private TravelContext travel = new TravelContext();
        public ActionResult Index()
        {
            var model = travel.Blogs.ToList();
            return View(model);
        }
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult blog()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(FormCollection f)
        {
            string TenTaiKhoan = f["txtTenDangNhap"].ToString();
            string MatKhau = f["txtPassword"].ToString();
            ThanhVien tv = travel.ThanhViens.SingleOrDefault(n => n.email == TenTaiKhoan);
            if (tv != null)
            {
                if (tv.pass == PasswordHelper.ComputeHash(MatKhau, "MD5", GetBytes("Website")))
                {
                    Session["TaiKhoan"] = tv;
                   
                    return RedirectToAction("Index","Home");
                }
            }
            return Content("Tài khoản hoặc mật khẩu không đúng!");
        }
        public ActionResult DangXuat()
        {
            Session["TaiKhoan"] = null;
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
        [HttpPost]
        public ActionResult DangKy(string username, string pass, string email)
        {
            var tv1 = travel.ThanhViens.FirstOrDefault(n => n.email == email);
            if (tv1 == null)
            {
                var count = travel.ThanhViens.Count();
                Console.WriteLine(count.ToString());
                ThanhVien tv = new ThanhVien();
                tv.MaThanhVien = count;
                tv.pass = PasswordHelper.ComputeHash(pass, "MD5", GetBytes("Website"));
                tv.email = email;
                tv.username = username;
                travel.ThanhViens.Add(tv);
                travel.SaveChanges();
                TempData["ThongBao"] = "<script>alert('Signout Success!');</script>";
                return RedirectToAction("Login", "Home");
            }
            else
            {
                TempData["ThongBao"] = "<script>alert('Signout Failed!');</script>";
                return RedirectToAction("Login", "Home");
            }
           
        }
        private static byte[] GetBytes(string str)
        {
            byte[] bytes = new byte[str.Length * sizeof(char)];
            System.Buffer.BlockCopy(str.ToCharArray(), 0, bytes, 0, bytes.Length);
            return bytes;
        }
        [HttpPost]
        public ActionResult Contact(string email,string message)
        {
            Contact ct = new Contact();
            ct.email = email;
            ct.mess = message;
            travel.Contacts.Add(ct);
            travel.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
}