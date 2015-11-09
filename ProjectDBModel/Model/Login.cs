using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProjectDBModel;

namespace ProjectDBModel.Models
{
    [MetadataType(typeof(LoginMeta))]
    partial class Login
    {

        class LoginMeta {

            public int Id { get; set; }

            [Required]
            [Display(Name ="Email")]
            [DataType(DataType.EmailAddress)]
            public string Email { get; set; }

            [Required]
            [Display(Name ="Password")]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            public string Password { get; set; }
        }

    }
}
