using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TravelProject.Models;

namespace TravelProject.Controllers
{
    public class DestinationController : Controller
    {
        private TravelContext travel = new TravelContext();
        // GET: Destination
        public ActionResult Index()
        {
            var model = travel.DiaDanhs.ToList();
            return View(model);
        }
        [HttpPost]
        public ActionResult Index(string search)
        {
            var model = travel.DiaDanhs.Where(x => x.TenDiaDanh.Contains(search)).ToList();
            return View(model);
        }
        public ActionResult DestinationDetail(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //Nếu không thì truy xuất csdl lấy ra sản phẩm tương ứng
            DiaDanh dd = travel.DiaDanhs.SingleOrDefault(n => n.MaDiaDanh == id);
            if (dd == null)
            {
                //Thông báo nếu như không có sản phẩm đó
                return HttpNotFound();
            }
            return View(dd);
        }
        
    }
}