using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace TravelProject.Controllers
{
    public class CaptchaController : Controller
    {
        // GET: Captcha
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult FormSubmit()
        {
            var response = Request["g-recaptcha-response"];
            string secretKey = "6Lcj9OAZAAAAAIuzlZNXcHVmE-T5zC99J0pRBLsK";
            var client = new WebClient();
            ViewData["Message"] = "Google reCaptcha validation success";
            return RedirectToAction("Login","Home");
        }
    }
}