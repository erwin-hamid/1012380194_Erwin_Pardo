using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Entities
{
    public class Customer
    {
        public int IdentificationType  { get; set; }

        public string Identification { get; set; }

        public string Names { get; set; }

        public string LastNames { get; set; }

        public DateTime Birthdate { get; set; }

        public int Gender { get; set; }

        public int CivilStatus { get; set; }

        public string Address { get; set; }

        public string PhoneNumbers { get; set; }

        public string Company { get; set; }

        public string CompanyPhones { get; set; }

        public int CompanyWorkTime { get; set; }

        public long MonthlyIncomes { get; set; }
    }   
}
