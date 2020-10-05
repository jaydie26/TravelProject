using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TravelProject.Controllers
{
    public class TourController : Controller
    {
        // GET: Tour
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult TourPlace()
        {
            return View();
        }
        public ActionResult Booking()
        {
            return View();
        }
    }
}