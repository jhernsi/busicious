using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectDBModel;
using ProjectApp2;

namespace ProjectApp2.Controllers
{
    public class ProjectsController : Controller
    {
        private ProjectDBEntities db = new ProjectDBEntities();

        // GET: Projects
        public ActionResult Index()
        {
            var projects = db.Projects.Include(p => p.Account);
            return View(projects.ToList());
        }

        public ActionResult PartialProject(int? Id)
        {
            //if(account == null)
            //{
            //    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //}
            if(Id < 0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
           
            Project project = (from p in db.Projects
                                where p.AccountId == Id
                                select p).First();

            return View(project);
            
           
        }
         [ChildActionOnly]
        public ActionResult RelatedProjects(int? id)
        {
            if(id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadGateway);
            }

            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }

            AccountProjectVM APVM = new AccountProjectVM();

            APVM.Account = account;
            foreach(Project p in db.Projects)
            {
                if (p.AccountId == id)
                {
                    APVM.RelatedProjects.Add(new ProjectDBModel.RelatedProjects()
                    {
                        Id = p.Id,
                        PName = p.PName,
                        PSubHeading = p.PSubHeading,
                        PInfo = p.PInfo,
                        PLogo = p.PLogo,
                        ReqInvestment = p.ReqInvestment,
                        PRatings = p.PRatings,
                        PStartDate = p.PStartDate,
                        PEndDate = p.PEndDate,
                        AccountId = p.AccountId
                    });
                }
               
            }
            return PartialView("~/Views/Projects/_RelatedProjects.cshtml", APVM);
        }

        
        public ActionResult RelatedProjects2()
        {
            string id = "25";

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadGateway);
            }

            Account account = db.Accounts.Find(Convert.ToInt32(id));
            if (account == null)
            {
                return HttpNotFound();
            }

            AccountProjectVM APVM = new AccountProjectVM();

            APVM.Account = account;
            foreach (Project p in db.Projects)
            {
                if (p.AccountId == Convert.ToInt32(id))
                {
                    APVM.RelatedProjects.Add(new ProjectDBModel.RelatedProjects()
                    {
                        Id = p.Id,
                        PName = p.PName,
                        PSubHeading = p.PSubHeading,
                        PInfo = p.PInfo,
                        PLogo = p.PLogo,
                        ReqInvestment = p.ReqInvestment,
                        PRatings = p.PRatings,
                        PStartDate = p.PStartDate,
                        PEndDate = p.PEndDate,
                        AccountId = p.AccountId
                    });
                }

            }
            return PartialView("~/Views/Projects/_RelatedProjects.cshtml", APVM);
        }


        // GET: Projects/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        // GET: Projects/Create
        public ActionResult Create()
        {
            ViewBag.AccountId = new SelectList(db.Accounts, "Id", "FirstName");
            return View();
        }

        // POST: Projects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,PName,PSubHeading,PInfo,PLogo,PRatings,ReqInvestment,PStartDate,PEndDate,AccountId")] Project project)
        {
            if (ModelState.IsValid)
            {
               //project.AccountId = 
                db.Projects.Add(project);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.AccountId = new SelectList(db.Accounts, "Id", "FirstName", project.AccountId);
            return View(project);
        }

        // GET: Projects/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            ViewBag.AccountId = new SelectList(db.Accounts, "Id", "FirstName", project.AccountId);
            return View(project);
        }

        // POST: Projects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,PName,PSubHeading,PInfo,PLogo,PRatings,ReqInvestment,PStartDate,PEndDate,AccountId")] Project project)
        {
            if (ModelState.IsValid)
            {
                db.Entry(project).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AccountId = new SelectList(db.Accounts, "Id", "FirstName", project.AccountId);
            return View(project);
        }

        // GET: Projects/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Project project = db.Projects.Find(id);
            if (project == null)
            {
                return HttpNotFound();
            }
            return View(project);
        }

        // POST: Projects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Project project = db.Projects.Find(id);
            db.Projects.Remove(project);
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
