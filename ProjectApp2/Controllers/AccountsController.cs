using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectDBModel;
using System.Data.Entity.Validation;
using System.Security.Cryptography;
using System.Web.Security;

namespace ProjectApp2.Controllers
{
    public class AccountsController : Controller
    {
        private ProjectDBEntities db = new ProjectDBEntities();

        // GET: Accounts
        //public ActionResult Index()
        //{
        //    var accounts = db.Accounts.Include(a => a.AccountType);
        //    return View(accounts.ToList());
        //}


        public ViewResult Index(string q)
        {
            var persons = from p in db.Accounts select p;
            if (!string.IsNullOrWhiteSpace(q))
            {
               
                persons = persons.Where(p => p.UserName.Contains(q) || p.Company.Contains(q) || p.FirstName.Contains(q));
                
            }
            return View(persons);
        }
        public ActionResult DisplayAllStarters()
        {
            //int accTypeId = 2;
            //var accounts = db.Accounts.Include(a => a.AccountType);
            //List<Account> StarterList = new List<Account>();
            //foreach(Account ac in accounts)
            //{
            //    if(ac.AccountType_Id == accTypeId)
            //    {
            //        StarterList.Add(ac);
            //    }
            //}
            //return View(StarterList);


            int accTypeId = 2;
            var accounts = db.Accounts.Include(a => a.AccountType);
            var userAccounts = (from ac in db.Accounts
                            where ac.AccountType_Id == 2
                            select ac).First();
            //var result = db.Accounts.Where(model => model.AccountType_Id.Equals(Account.Email)
            //        && model.Password.Equals(Account.Password)).FirstOrDefault();

            //var userAccounts2 = db.Accounts.Where(Account => Account.AccountType_Id == 2)
            //    .Select Account);

            List< AccountProjectVM > StarterList = new List<AccountProjectVM>();
            foreach (Account ac in accounts)
            {
                if (ac.AccountType_Id == accTypeId)
                {
                    AccountProjectVM APVM = new AccountProjectVM();
                    APVM.Account = ac;

                    foreach (Project p in db.Projects)
                    {
                        if (p.AccountId == ac.Id)
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
                    StarterList.Add(APVM);
                }
            }
            return View(StarterList);
           // return PartialView("~/Views/Projects/_RelatedProjects.cshtml", APVM);



        }

        // GET: Accounts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }


        // GET: Accounts/UserProfile/5
        public ActionResult UserProfile(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }


        // GET: Accounts/Create
        public ActionResult Create()
        {
            ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type");
            return View();
        }

        // POST: Accounts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FirstName,LastName,Password,UserName,ConfirmPassword,Email,Company,CompanyLogo,Street,PostalCode,City,State,Country,Phone,CellPhone,FaxNumber,Website,About,AccountType_Id")] Account account)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    db.Accounts.Add(account);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type", account.AccountType_Id);
                return View(account);
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }

        }

        // GET: Accounts/Register
        public ActionResult Register()
        {
            ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type");
            return View();
        }

        // GET: Accounts/Login
        public ActionResult Login() {

            ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type");
            return View();
        }

        // GET: Accounts/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login([Bind(Include= "Email,Password,ConfirmPassword")] Account Account)
        {
            if (ModelState.IsValid)
            {
                //var result = db.Accounts.Where(model => model.Email.Equals(Account.Email) 
                //        && model.Password.Equals(Account.Password)).FirstOrDefault();
                //if (result != null)
                //{
                //    Session["LogedUserID"] = result.Id.ToString();
                //    Session["LogedUserName"] = result.UserName.ToString();

                //    return RedirectToAction("PostLogin");
                //}

                var result = (from ac in db.Accounts
                             where ac.Email == Account.Email
                
                             select ac).FirstOrDefault();

                if(result != null)
                {
                    if(result.Password == CreatePasswordHash(Account.Password, result.Salt))
                    {
                        Session["LogedUserID"] = result.Id.ToString();
                        Session["LogedUserName"] = result.UserName.ToString();

                        return RedirectToAction("PostLogin");
                    }
                    else
                    {
                        ViewBag.Email = Account.Email;
                        ViewBag.Password = Account.Password;
                        return View();
                    }
                }
            }
            return View(Account);
        }

        public ActionResult PostLogin()
        {
            if (Session["LogedUserID"] != null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index");
            }
        }

         
        // POST: Accounts/Register
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register([Bind(Include = "Id,FirstName,LastName,UserName,Password,ConfirmPassword,Email,AccountType_Id")] Account account)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    
                    var result = db.Accounts.Where(model => model.Email.Equals(account.Email)
                        && model.AccountType_Id.Equals(account.AccountType_Id)).FirstOrDefault();
                    if (result != null)
                    {
                        Session["SessRegisterationMessage"] = "This email address is already in use. Please login with your existing account or use a different email address to register.";
                        Session["SessEmail"] = (account.Email);
                        Session["SessAccountType"] = account.AccountType_Id;
                        Session["SessEmailInDB"] = result.Email.ToString();
                        Session["SessEmailInDB"] = result.Email.ToString();

                        return RedirectToAction("Register");
                    }

                    account.Salt = CreateSalt();
                    account.Password = CreatePasswordHash(account.Password, account.Salt);
                    account.ConfirmPassword = CreatePasswordHash(account.ConfirmPassword, account.Salt);

                    db.Accounts.Add(account);
                    db.SaveChanges();

                    return RedirectToAction("RegisterSuccess");
                }

                ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type", account.AccountType_Id);
                return View(account);
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }
        private static string CreateSalt()
        {
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] byteArr = new byte[64];
            rng.GetBytes(byteArr);

            return Convert.ToBase64String(byteArr);
        }

        private static string CreatePasswordHash(string password, string salt)
        {
            string passwordSalt = String.Concat(password, salt);
            string hashedPwd = FormsAuthentication.HashPasswordForStoringInConfigFile(passwordSalt, "sha1");
            return hashedPwd;
        }

        // GET: Accounts/RegisterSuccess
        public ActionResult RegisterSuccess()
        {
            //ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type");
            return View();
        }


        // GET: Accounts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type", account.AccountType_Id);
            return View(account);
        }

        // POST: Accounts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstName,LastName,Password,UserTypeId,ConfirmPassword,Email,Company,CompanyLogo,Street,PostalCode,City,State,Country,Phone,CellPhone,FaxNumber,Website,About,AccountType_Id")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Entry(account).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.AccountType_Id = new SelectList(db.AccountTypes, "Id", "Type", account.AccountType_Id);
            return View(account);
        }

        // GET: Accounts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account account = db.Accounts.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        // POST: Accounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Account account = db.Accounts.Find(id);
            db.Accounts.Remove(account);
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
