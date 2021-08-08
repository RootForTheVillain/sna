using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using api.Models;
using System.Linq;
using System.Threading.Tasks;

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

        [HttpPost("~/networks")]
        public async Task<ActionResult<Network>> CreateNetwork(Network network)
        {
            _appDbContext.Networks.Add(network);
            await _appDbContext.SaveChangesAsync();

            return CreatedAtAction(nameof(Network), new { id = network.NetworkId }, network);
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
