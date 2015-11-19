using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ProjectDBModel;
namespace ProjectApp2.Controllers
{
    public class CommentController : ApiController
    {
        private ProjectDBEntities db = new ProjectDBEntities();
        public HttpResponseMessage PostPostComment(Comment postcomment)
        {
          //  postcomment.CommentedBy = WebSecurity.CurrentUserId;
            postcomment.CommentDate = DateTime.UtcNow.ToString();
            ModelState.Remove("postcomment.CommentedBy");
            ModelState.Remove("postcomment.CommentedDate");
            if (ModelState.IsValid)
            {
                db.Comments.Add(postcomment);
                db.SaveChanges();
                var usr = db.Accounts.FirstOrDefault(x => x.UserName == postcomment.CommentedBy);
                var ret = new
                {
                    CommentedBy = postcomment.CommentedBy,
                    CommentedByName = usr.UserName,
                    //CommentedByAvatar = imgFolder + (String.IsNullOrEmpty(usr.AvatarExt) ? defaultAvatar : postcomment.CommentedBy + "." + postcomment.UserProfile.AvatarExt),
                    CommentedDate = postcomment.CommentDate,
                    CommentId = postcomment.Id,
                    Message = postcomment.CommentData,
                    PostId = postcomment.PostId
                };

                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, ret);
                response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = postcomment.Id }));
                return response;
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
 
    
    }
}
