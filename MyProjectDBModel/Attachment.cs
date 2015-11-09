//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyProjectDBModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class Attachment
    {
        public int Id { get; set; }
        public string AttachmentName { get; set; }
        public string AttachmentCreator { get; set; }
        public string FileType { get; set; }
        public string FileSize { get; set; }
        public string AttachmentDate { get; set; }
        public string AttachmentTime { get; set; }
        public string EncryptedName { get; set; }
        public Nullable<int> ProjectsId { get; set; }
        public int AccountId { get; set; }
        public int MailId { get; set; }
        public int ProjectId { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual Mail Mail { get; set; }
        public virtual Project Project { get; set; }
    }
}
