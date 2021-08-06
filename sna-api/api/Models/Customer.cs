using System;
using System.Collections.Generic;

namespace api.Models
{
    public class Customer
    {
        public Customer()
        {
        }

        public string Name { get; set; }
        public int CustomerId { get; set; }
        //public ICollection<Network> Networks { get; set; }
    }
}
