using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;
using PagedList;
using System.Data.Entity;
using Newtonsoft.Json;

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
            TravelContext mdt = new TravelContext();
            var model = mdt.ChiTietTours.SingleOrDefault(x => x.MaChiTietTour == id);
            return View(model);
        }
        public ActionResult Booking(int matour, int songay, string tentour)
        {
            ViewBag.MaTour = matour;
            ViewBag.songay = songay;
            ViewBag.tentour = tentour;
            return View();
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
        public void CapnhatTTNLH(string ten,string email, string diachi, string dienthoai, string note)
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
        public void CapnhatPhieuDatTour(string pickupplace, int matour)
        {
            TravelContext md = new TravelContext();
            int idnlh = md.NguoiLienHes.Count()+1;
            int idpdt = md.PhieuDatTours.Count()+1;
            PhieuDatTour pdt = new PhieuDatTour();
            pdt.DiaDiemDon = pickupplace;
            pdt.MaNguoiLienHe = idnlh;
            pdt.MaPhieuDat = idpdt;
            pdt.MaTour = matour;
            md.PhieuDatTours.Add(pdt);
            md.SaveChanges();
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