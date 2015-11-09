using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDBModel
{
    [MetadataType(typeof(ProjectMeta))]
    partial class Project
    {
        class ProjectMeta
        {
            public int Id { get; set; }

            [Required]
            [Display(Name = "Project Name")]
            [MinLength(3, ErrorMessage = "Project name must be 4 or more characters long.")]
            public string PName { get; set; }

            //[Required]
            [Display(Name = "Project Sub-Heading")]
            [MinLength(3, ErrorMessage = "Project sub heading must be 4 or more characters long.")]
            public string PSubHeading { get; set; }

           // [Required]
            [Display(Name = "Project Information")]
            [MinLength(3, ErrorMessage = "Project information must be 4 or more characters long.")]
            public string PInfo { get; set; }

            [Display(Name = "Project Logo Name")]
            public string PLogo { get; set; }

            //[Required]
            [Display(Name = "Project Ratings")]
            public string PRatings { get; set; }

            //[Required]
            [Display(Name = "Project Investoment")]
            [DataType(DataType.Currency)]
            [Range(100, 10000000, ErrorMessage = "Project Investoment can not be less than $100")]
            public string ReqInvestment { get; set; }

            [Display(Name = "Project Start Date")]
            //[DataType(DataType.Date)]
            public string PStartDate { get; set; }

            [Display(Name = "Project End Date")]
            //[DataType(DataType.Date)]
            public string PEndDate { get; set; }

            [Display(Name = "Project by")]
            public int AccountId { get; set; }
        }
    }
}
