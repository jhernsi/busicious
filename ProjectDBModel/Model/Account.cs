using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using ProjectDBModel;

namespace ProjectDBModel
{
    [MetadataType(typeof(AccountMeta))]
    partial class Account
    {
        class AccountMeta
        {
            public int Id { get; set; }

        
            [Display(Name = "First Name")]
            [MinLength(4, ErrorMessage = "First name must be 4 or more characters long.")]
            public string FirstName { get; set; }

           
            [Display(Name = "Last Name")]
            [MinLength(4, ErrorMessage = "Last name must be 4 or more characters long.")]
            public string LastName { get; set; }


            
            [Display(Name = "User Name")]
            [MinLength(4, ErrorMessage = "User name must be 4 or more characters long and unique.")]
            public string UserName { get; set; }


            [Required]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} characters long.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            [Display(Name = "Password")]
            public string Password { get; set; }

        

            [DataType(DataType.Password)]
            [Display(Name = "Confirm password")]
            [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
            public string ConfirmPassword { get; set; }

            [Required]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }
            public string Company { get; set; }
            public string CompanyLogo { get; set; }
            public string Street { get; set; }
            public string PostalCode { get; set; }
            public string City { get; set; }
            public string State { get; set; }
            public string Country { get; set; }

            [Display(Name = "Phone Number")]
            public string Phone { get; set; }
            public string CellPhone { get; set; }
            public string FaxNumber { get; set; }
            public string Website { get; set; }
            public string About { get; set; }

            [Required]
            [Display(Name = "User Type", Description = "Starter, Investor or Guest")]
            public int AccountType_Id { get; set; }
        }
    }
    
}
