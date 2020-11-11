using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace TravelProject.Controllers
{
    [AllowAnonymous]
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
            string secretKey = "6Ld_VOEZAAAAABw_1l49t8neWcK_ehP0qw3kxXDh";
            var client = new WebClient();
            ViewData["Message"] = "Google reCaptcha validation success";
            return RedirectToAction("Login","Home");
        }
    }
}