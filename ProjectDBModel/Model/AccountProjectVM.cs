using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectDBModel
{
    public class AccountProjectVM
    {
        public Account Account { get; set; }
        public List<RelatedProjects> RelatedProjects { get; set; }

        public AccountProjectVM()
        {
            this.Account = new Account();
            this.RelatedProjects = new List<RelatedProjects>();
        }
    }

    public class RelatedProjects
    {
        public int Id { get; set; }
        public string PName { get; set; }
        public string PSubHeading { get; set; }
        public string PInfo { get; set; }
        public string PLogo { get; set; }
        public string PRatings { get; set; }
        public string ReqInvestment { get; set; }
        public string PStartDate { get; set; }
        public string PEndDate { get; set; }
        public int AccountId { get; set; }
    }
}
