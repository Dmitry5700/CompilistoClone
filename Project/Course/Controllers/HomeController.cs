using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Course.Models;

namespace Course.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {


            return View();
        }

        public ActionResult About()
        {


            return View();
        }

        public ActionResult Contact()
        {


            return View();
        }

        public ActionResult EditLesson()
        {
            return View();
        }


    }
}