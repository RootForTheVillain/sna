using System;
namespace api.Models
{
    public class Organization
    {
        public int OrganizationId { get; set; }
        public string Specialty { get; set; }
        public long Npi { get; set; }

        public Organization()
        {
        }
    }
}
