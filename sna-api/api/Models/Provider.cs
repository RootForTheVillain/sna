using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace api.Models
{
    public class Provider
    {
        public int ProviderId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public int ZipCode { get; set; }
        public string Specialty { get; set; }
        public long Npi { get; set; }

        [JsonIgnore]
        public virtual ICollection<NetworkProvider> NetworkProviders { get; set; }

        public Provider()
        {
            NetworkProviders = new List<NetworkProvider>();
        }
    }
}
