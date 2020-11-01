using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;
using PagedList;
using System.Data.Entity;

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
            
            int pageSize = 5;
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
        public ActionResult Booking()
        {
            return View();
        }
        public string CheckRadio(FormCollection frm)
        {
            string genderradio = frm["rating"].ToString();
            return genderradio;
        }
        [HttpPost]
        public ActionResult Edit(DanhGia danhgia)
        {
            TravelContext md = new TravelContext();
            md.Entry(danhgia).State = EntityState.Modified;
            md.SaveChanges();
            return RedirectToAction("Index");
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