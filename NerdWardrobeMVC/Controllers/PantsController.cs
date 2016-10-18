using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using NerdWardrobeMVC.Models;

namespace NerdWardrobeMVC.Controllers
{
    public class PantsController : Controller
    {
        private NerdWardrobeEntities db = new NerdWardrobeEntities();

        // GET: Pants
        public ActionResult Index()
        {
            var pants = db.Pants.Include(p => p.Occassion).Include(p => p.Season);
            return View(pants.ToList());
        }

        // GET: Pants/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pant pant = db.Pants.Find(id);
            if (pant == null)
            {
                return HttpNotFound();
            }
            return View(pant);
        }

        // GET: Pants/Create
        public ActionResult Create()
        {
            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionName");
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonName");
            return View();
        }

        // POST: Pants/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PantsId,PantsName,PantsType,PantsColor,PantsPhoto,OccassionID,SeasonID")] Pant pant)
        {
            if (ModelState.IsValid)
            {
                db.Pants.Add(pant);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionName", pant.OccassionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonName", pant.SeasonID);
            return View(pant);
        }

        // GET: Pants/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pant pant = db.Pants.Find(id);
            if (pant == null)
            {
                return HttpNotFound();
            }
            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionName", pant.OccassionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonName", pant.SeasonID);
            return View(pant);
        }

        // POST: Pants/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PantsId,PantsName,PantsType,PantsColor,PantsPhoto,OccassionID,SeasonID")] Pant pant)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OccassionID = new SelectList(db.Occassions, "OccassionID", "OccassionName", pant.OccassionID);
            ViewBag.SeasonID = new SelectList(db.Seasons, "SeasonID", "SeasonName", pant.SeasonID);
            return View(pant);
        }

        // GET: Pants/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Pant pant = db.Pants.Find(id);
            if (pant == null)
            {
                return HttpNotFound();
            }
            return View(pant);
        }

        // POST: Pants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Pant pant = db.Pants.Find(id);
            db.Pants.Remove(pant);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
