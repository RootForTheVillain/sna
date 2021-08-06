using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace api.Models
{
    public class Provider
    {
        public int ProviderId { get; set; }
        public string Name { get; set; }

        [JsonIgnore]
        public virtual ICollection<NetworkProvider> NetworkProviders { get; set; }

        public Provider()
        {
            NetworkProviders = new List<NetworkProvider>();
        }
    }
}
