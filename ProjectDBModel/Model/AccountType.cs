using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace ProjectDBModel
{
    [MetadataType(typeof(AccountTypeMeta))]
    partial class AccountType
    {
        class AccountTypeMeta
        {
            public int Id { get; set; }
            public string Type { get; set; }
            public string AccountTypeLogo { get; set; }
        }
    }
}
