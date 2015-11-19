//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectDBModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Comment()
        {
            this.Ratings = new HashSet<Rating>();
        }
    
        public int Id { get; set; }
        public string CommentData { get; set; }
        public string CommentTarget { get; set; }
        public string CommentDate { get; set; }
        public string CommentTime { get; set; }
        public string CommentAttachement { get; set; }
        public int AccountId { get; set; }
        public int ProjectId { get; set; }
        public string PostId { get; set; }
        public int PostPostId { get; set; }
        public string CommentedBy { get; set; }
    
        public virtual Account Account { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Rating> Ratings { get; set; }
        public virtual Project Project { get; set; }
        public virtual Post Post { get; set; }
    }
}
