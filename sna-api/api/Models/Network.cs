﻿using System;
using System.Collections.Generic;
using Microsoft.Extensions.Logging;

using api.Interfaces;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text.Json.Serialization;
using Microsoft.EntityFrameworkCore;

namespace api.Models
{
    public class Network
    {
        private List<Provider> _providers = new();

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int NetworkId { get; set; }
        public string Name { get; set; }

        [JsonIgnore]
        public virtual ICollection<NetworkProvider> NetworkProviders { get; set; }

        /*public virtual List<Provider> Providers
        {
            get
            {
                foreach (NetworkProvider np in NetworkProviders)
                {
                    _providers.Add(np.Provider);
                }
                return _providers;
            }
        }*/

        //public virtual ICollection<IScore> Scores { get; set; }

        public Network()
        {
            NetworkProviders = new List<NetworkProvider>();
        }
    }
}