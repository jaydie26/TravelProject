﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;
using System.Web.Security;

namespace TravelProject.Controllers
{
    public class HomeController : Controller
    {
        private TravelContext travel = new TravelContext();
        public ActionResult Index()
        {
            return View();
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
                if (tv.pass == MatKhau)
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
                tv.pass = pass;
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
    }
}