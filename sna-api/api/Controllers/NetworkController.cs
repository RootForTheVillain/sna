using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Data.Entity;

using api.Models;
using api.Interfaces;
using System.Linq;
using Microsoft.EntityFrameworkCore.Internal;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NetworkController : ControllerBase
    {
        private readonly AppDbContext _appDbContext;
        private readonly ILogger<NetworkController> _logger;

        public NetworkController(AppDbContext appDbContext, ILogger<NetworkController> logger)
        {
            _appDbContext = appDbContext;
            _logger = logger;
        }

        [HttpGet("~/networks")]
        public List<Network> GetAllNetworks()
        {
            List<Network> networks = new();
            try
            {
                networks = _appDbContext.Networks.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return networks;
        }

        [HttpGet("~/networks/{id}")]
        public Network GetNetworkById(int id)
        {
            Network network = new();
            try
            {
                network = _appDbContext.Networks.Find(id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return network;
        }

        [HttpGet("~/networks/{id}/providers")]
        public ICollection<NetworkProvider> GetProvidersByNetworkId(int id)
        {
            List<NetworkProvider> providers = new();
            try
            {
                providers = _appDbContext.Networks.Find(id).NetworkProviders.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return providers;
        }

        [HttpPut("~/networks/{id}/providers")]
        public void AddProviderToNetwork(int id, Provider provider)
        {
            try
            {
                NetworkProvider np = new();
                np.NetworkId = id;
                //np.ProviderId = provider.ProviderId;
                np.Provider = provider;

                var networkProviders = _appDbContext.Networks.Find(id).NetworkProviders;

                if (!networkProviders.Contains(np))
                {
                    networkProviders.Add(np);
                    _appDbContext.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
        }


        /*
         * RLS
        [HttpGet("~/networks")]
        public List<Network> GetNetworksByCustomerId(int id)
        {
            List<Network> networks = new();
            try
            {
                networks = _appDbContext.Customers.Find(id).Networks.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return networks;
        }*/
    }
}
