using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ProjectDBModel;
using System.Net;
using System.Data;

namespace ProjectApp2.Controllers
{
    public class WallPostController : ApiController
    {
        private ProjectDBEntities db = new ProjectDBEntities();

        public dynamic getPosts()
        {
            var ret = (from post in db.Posts.ToList()
                       orderby post.PostDate descending
                       select new
                       {
                           Message = post.Message,
                           PostedBy = post.PostedBy,
                           PostedByName = post.Account.UserName,
                           PostedDate = post.PostDate,
                           PostId = post.PostId,
                           PostComments = from comment in post.Comments.ToList()
                                          orderby comment.CommentDate
                                          select new
                                          {
                                              commentedBy = comment.CommentedBy,
                                              CommentedByName = comment.Account.UserName,
                                              CommentedDate = comment.CommentDate,
                                              CommentId = comment.Id,
                                              Message = comment.CommentData,
                                              PostId = comment.PostId
                                          }
                       }).AsEnumerable();

            return ret;
        }

        
        // GET api/WallPost/5
        public Post GetPost(int id)
        {
            Post post = db.Posts.Find(id);
            if (post == null)
            {
                throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
            }

            return post;
        }

        //// PUT api/WallPost/5
        //public HttpResponseMessage PutPost(int id, Post post)
        //{
        //    if (!ModelState.IsValid)
        //    {
        //        return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
        //    }

        //    if (id != post.PostId)
        //    {
        //        return Request.CreateResponse(HttpStatusCode.BadRequest);
        //    }

        //    db.Entry(post).State = EntityState.Modified;

        //    try
        //    {
        //        db.SaveChanges();
        //    }
        //    catch (DbUpdateConcurrencyException ex)
        //    {
        //        return Request.CreateErrorResponse(HttpStatusCode.NotFound, ex);
        //    }

        //    return Request.CreateResponse(HttpStatusCode.OK);
        //}


         
      // POST api/WallPost
      public HttpResponseMessage PostPost(Post post)
      {
          //post.PostedBy = CurrentUserId;
          DateTime now = DateTime.UtcNow;
          post.PostDate = now.ToString();
          ModelState.Remove("post.PostedBy");
          ModelState.Remove("post.PostedDate");
 
          if (ModelState.IsValid)
          {
              db.Posts.Add(post);
              db.SaveChanges();
              var usr = db.Accounts.FirstOrDefault(x => x.UserName == post.PostedBy);
              var ret = new
                    {
                        Message = post.Message,
                        PostedBy = post.PostedBy,
                        PostedByName = usr.UserName,
                        //PostedByAvatar = imgFolder +(String.IsNullOrEmpty(usr.AvatarExt) ? defaultAvatar : post.PostedBy + "." + post.UserProfile.AvatarExt),
                        PostedDate = post.PostDate,
                        PostId = post.PostId
                    };
              HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.Created, ret);
              response.Headers.Location = new Uri(Url.Link("DefaultApi", new { id = post.PostId }));
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

