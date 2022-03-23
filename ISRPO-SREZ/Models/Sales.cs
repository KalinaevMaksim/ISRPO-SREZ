using System;
using System.Collections.Generic;

namespace ISRPO_SREZ.Models
{
    public class Sales
    {
        public DateTime dateSale { get; set; }
        public Client client { get; set; }
        public List<Telephone> telephones { get; set; }
    }
}