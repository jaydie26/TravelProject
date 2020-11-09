using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;
using PagedList;
using System.Data.Entity;
using Newtonsoft.Json;
using System.Net.Mail;
using System.Net;
using System.Drawing;
using System.IO;
using QRCoder;
using System.Windows;

namespace TravelProject.Controllers
{
    public class TourController : Controller
    {
        // GET: Tour
        public ActionResult Index(int? page, string place="", string day="",  string sortorder="",int? star=0, int? pricedown=null, int? priceup=null)
        {
            TravelContext md = new TravelContext();
            var model = md.Tours.ToList();
            switch (sortorder)
            {
                case "all":
                    model = md.Tours.ToList();
                    model = getModelByKey(model,place, day);
                    model = getModelByPrice(model,pricedown, priceup);
                    break;
                case "price":
                    model = model.OrderByDescending(x => x.Gia).ToList();
                    model = getModelByKey(model, place, day);
                    model = getModelByPrice(model, pricedown, priceup);
                    break;
                case "star":
                    model = getModelByKey(model, place, day);
                    model = getModelByPrice(model, pricedown, priceup);
                    break;
                case "review":
                    model = model.OrderByDescending(x => x.NumView).ToList();
                    model = getModelByKey(model, place, day);
                    model = getModelByPrice(model, pricedown, priceup);
                    break;
                case "day":
                    model = model.OrderByDescending(x => x.NumDay).ToList();
                    model = getModelByKey(model,place, day);
                    model = getModelByPrice(model, pricedown, priceup);
                    break;
                default:
                    model = md.Tours.ToList();
                    model = getModelByKey(model,place, day);
                    model = getModelByPrice(model, pricedown, priceup);
                    break;

            }
            ViewBag.place = place;
            ViewBag.day = day;
            if (sortorder == "")
            {
                ViewBag.sortorder = "all";
            }
            else {
                ViewBag.sortorder = sortorder;
            }
            
            int pageSize = 6;
            int no_of_page = (page ?? 1);
            return View(model.ToPagedList(no_of_page, pageSize));
        }
        public List<Tour> getModelByKey(List<Tour> model,string place, string day)
        {
            if (day != "" && place != "")
            {
                int day2 = Convert.ToInt32(day);
                model = model.Where(x => (x.DiaDiem.Contains(place) && x.NumDay == day2)).ToList();
            }
            if (place == "" && day != "")
            {
                int day2 = Convert.ToInt32(day);
                model = model.Where(x => x.NumDay == day2).ToList();
            }
            if (place != "" && day == "")
            {
                model = model.Where(x => x.DiaDiem.Contains(place)).ToList();
            }
            if (day == "" && place == "")
            {
                model = model.ToList();
            }
            return model;
        }
        public List<Tour> getModelByPrice(List<Tour> model, int? pricedown, int? priceup)
        {
            if(pricedown!=null && priceup != null)
            {
                model = model.Where(x => (x.Gia >= pricedown && x.Gia <= priceup)).ToList();
            }
            if (pricedown == null && priceup != null)
            {
                model = model.Where(x =>x.Gia <= priceup).ToList();
            }
            if (pricedown != null && priceup == null)
            {
                model = model.Where(x => x.Gia >= pricedown).ToList();
            }
            return model;
        }
        public ActionResult TourPlace(int id)
        {
            ThanhVien tv = (ThanhVien)Session["TaiKhoan"];
            TravelContext mdt = new TravelContext();
            var model = mdt.ChiTietTours.SingleOrDefault(x => x.MaChiTietTour == id);
            var modelTour = mdt.Tours.SingleOrDefault(x => x.MaChiTietTour == model.MaChiTietTour);
            ViewBag.sosaoDG = 0;
            ViewBag.Matv = 0;
            if (tv != null) {
                var modelDanhGia = mdt.DanhGias.SingleOrDefault(x => x.MaTour == modelTour.MaTour && x.MaThanhVien == tv.MaThanhVien);
                ViewBag.sosaoDG = modelDanhGia.NumStar;
                ViewBag.Matv = tv.MaThanhVien;
            }
            ViewBag.Matour = modelTour.MaTour;
            ViewBag.Songay = modelTour.NumDay;
            ViewBag.Diadiem = modelTour.DiaDiem;
            ViewBag.Tentour = modelTour.TenTour;
            var modelSoLuongDanhGia = mdt.Soluong_DanhGia.Where(x => x.MaTour == modelTour.MaTour).ToList();
            int?[] sl = new int?[5] { 0, 0, 0, 0, 0 };
            int? tongsl = 0;
            foreach (Soluong_DanhGia item in modelSoLuongDanhGia)
            {
                tongsl += item.soluong;
                sl[item.Numstar - 1] = item.soluong;
            }
            int? p1 = sl[0] * 100 / tongsl;
            int? p2 = sl[1] * 100 / tongsl;
            int? p3 = sl[2] * 100 / tongsl;
            int? p4 = sl[3] * 100 / tongsl;
            int? p5 = sl[4] * 100 / tongsl;
            double rating = ((double)(sl[0] * 1 + sl[1] * 2 + sl[2] * 3 + sl[3] * 4 + sl[4] * 5) / (double)tongsl);
            rating = Math.Round(rating, 1);
            ViewBag.p1 = p1;
            ViewBag.p2 = p2;
            ViewBag.p3 = p3;
            ViewBag.p4 = p4;
            ViewBag.p5 = p5;
            ViewBag.tongsl = tongsl;
            ViewBag.rating = rating;
            return View(model);
        }

        public ActionResult Booking(int matour, int songay, string tentour)
        {
            TravelContext mdt = new TravelContext();
            var model = mdt.BangGias.FirstOrDefault(x => x.MaTour == matour);
            ViewBag.MaTour = matour;
            ViewBag.songay = songay;
            ViewBag.tentour = tentour;
            return View(model);
        }
        [HttpPost]
        public void CapnhatView(int matour)
        {
            TravelContext md = new TravelContext();
            var t = md.Tours.FirstOrDefault(x => x.MaTour == matour);
            t.NumView += 1;
            md.SaveChanges();
        }
        [HttpPost]

        public void CapnhatPhieuDatTour(string pickupplace, int matour, int gia)

        {
            TravelContext md = new TravelContext();
            int idnlh = md.NguoiLienHes.Count() + 1;
            int idpdt = md.PhieuDatTours.Count() + 1;
            PhieuDatTour pdt = new PhieuDatTour();
            pdt.DiaDiemDon = pickupplace;
            pdt.MaNguoiLienHe = idnlh;
            pdt.MaPhieuDat = idpdt;
            pdt.MaTour = matour;
            pdt.TongGia = gia;
            md.PhieuDatTours.Add(pdt);
            md.SaveChanges();

        }
        [HttpPost]
        public void CapnhatKH(string mangten, string mangdiachi, string mangloai, string manggt, string mangngay, int soluong)
        {
            TravelContext md = new TravelContext();
            int idkh = md.KhachHangs.Count() + 1;
            int idnlh = md.NguoiLienHes.Count() + 1;
            dynamic ten = JsonConvert.DeserializeObject(mangten);
            dynamic diachi = JsonConvert.DeserializeObject(mangdiachi);
            dynamic loai = JsonConvert.DeserializeObject(mangloai);
            dynamic gioitinh = JsonConvert.DeserializeObject(manggt);
            dynamic ngaysinh = JsonConvert.DeserializeObject(mangngay);
            for (int i = 0; i < soluong; i++)
            {
                KhachHang kh = new KhachHang();
                kh.MaKH = idkh;
                kh.TenKH = ten[i].ToString();
                kh.NgaySinh = ngaysinh[i].ToString();
                kh.DiaChi = diachi[i].ToString();
                kh.GioiTinh = gioitinh[i].ToString();
                kh.Loai = loai[i].ToString();
                kh.MaNguoiLienHe = idnlh;
                md.KhachHangs.Add(kh);
                idkh++;
            }
            md.SaveChanges();

        }
        [HttpPost]
        public void CapnhatTTNLH(string ten, string email, string diachi, string dienthoai, string note)
        {
            TravelContext md = new TravelContext();
            int idnlh = md.NguoiLienHes.Count() + 1;
            NguoiLienHe nlh = new NguoiLienHe();
            nlh.TenNguoiLienHe = ten;
            nlh.MaNguoiLienHe = idnlh;
            nlh.SoDienThoai = dienthoai;
            nlh.Email = email;
            nlh.GhiChu = note;
            nlh.Diachi = diachi;
            md.NguoiLienHes.Add(nlh);
            md.SaveChanges();
        }

        [HttpPost]
        public void CapnhatDanhGia(int rating, int id)
        {
            ThanhVien tv = (ThanhVien)Session["TaiKhoan"];
            TravelContext md = new TravelContext();
            var modelDG = md.DanhGias.SingleOrDefault(x => x.MaThanhVien == tv.MaThanhVien && x.MaTour == id);
            if (modelDG == null) {
                DanhGia dg = new DanhGia();
                dg.MaThanhVien = tv.MaThanhVien;
                dg.NumStar = rating;
                dg.MaTour = id;
                md.DanhGias.Add(dg);
            }
            else
            {
                md.DanhGias.SingleOrDefault(x => x.MaThanhVien == tv.MaThanhVien && x.MaTour == id).NumStar = rating;
            }
            md.SaveChanges();

        }
        [HttpPost]
        public ActionResult SendMail(string _mess)
        {
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(_mess, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(20);
            qrCodeImage.Save(Server.MapPath("~/Content/images/QRcode1.jpg"));
            ThanhVien tv = (ThanhVien)Session["TaiKhoan"];
            try
            {
                var senderEmail = new MailAddress("nguyendinhdai.no1@gmail.com", "S-VietNam");
                var receiverEmail = new MailAddress("nguyendinhdai01@gmail.com", "Nguyen Dinh Dai");
                var password = "nguyendinhdai";
                var sub = "Welcome to S-VietNam";
                var body = _mess;
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(senderEmail.Address, password)
                };
                Attachment ImageAttachment = new Attachment(Server.MapPath("~/Content/images/QRcode1.jpg"));
                ImageAttachment.ContentId = "QRcode.jpg";
                MailMessage mail = new MailMessage();
                mail.From = senderEmail;
                mail.To.Add(receiverEmail);
                mail.Subject = sub;
                mail.Body = body;
                mail.Attachments.Add(ImageAttachment);
                smtp.Send(mail);
                return View();
            }
            catch (Exception)
            {
                ViewBag.Error = "Some Error";
            }
            return View();
            
            

        }
        //public ActionResult TourByName_Day(string place, string day)
        //{
        //    TravelContext mdt = new TravelContext();
        //    var model = mdt.Tours.Where(x => x.DiaDiem.Contains(place)).ToList();
        //    if (day != "" && place != "")
        //    {
        //        int day2 = Convert.ToInt32(day);
        //        model = mdt.Tours.Where(x => (x.DiaDiem.Contains(place) && x.NumDay == day2)).ToList();
        //    }
        //    if(place == "" && day != "")
        //    {
        //        int day2 = Convert.ToInt32(day);
        //        model = mdt.Tours.Where(x =>  x.NumDay == day2).ToList();
        //    }
        //    if (day == "" && place == "")
        //    {
        //        model = mdt.Tours.ToList();
        //    }
        //    return PartialView("TourByName", model);
        //}
    }
}