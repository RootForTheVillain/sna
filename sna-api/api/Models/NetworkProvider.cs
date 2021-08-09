using System;
using System.ComponentModel.DataAnnotations;

namespace api.Models
{
    public class NetworkProvider
    {
        public int NetworkId { get; set; }
        public virtual Network Network { get; set; }

        public int ProviderId { get; set; }
        public bool IsVisible { get; set; }
        public bool IsFavorite { get; set; }
        public virtual Provider Provider { get; set; }
    }
}
