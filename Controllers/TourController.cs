using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;

namespace TravelProject.Controllers
{
    public class TourController : Controller
    {
        // GET: Tour
        public ActionResult Index()
        {
            TravelContext md = new TravelContext();
            var model = md.Tours.ToList();

            return View(model);
        }
        public ActionResult TourPlace()
        {
            return View();
        }
        public ActionResult Booking()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            TravelContext mdt = new TravelContext();
            var model = mdt.Tours.Where(x => x.Place.Contains(search)).ToList();
            return View(model);

        }
    }
}