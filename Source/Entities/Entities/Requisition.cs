using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities.Entities
{
    public class Requisition
    {
        public int CreditTypeId { get; set; }

        public int CustomerId { get; set; }

        public double Amount { get; set; }

        public int Term { get; set; }

        public double Quota { get; set; }
    }
}
