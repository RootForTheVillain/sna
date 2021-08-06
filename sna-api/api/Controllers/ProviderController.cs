using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using api.Models;
using api.Interfaces;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProviderController : ControllerBase
    {
        private readonly IAppDbContext _appDbContext = new AppDbContext();
        private readonly ILogger<ProviderController> _logger;

        public ProviderController(IAppDbContext appDbContext, ILogger<ProviderController> logger)
        {
            _appDbContext = appDbContext;
            _logger = logger;
        }

        [HttpGet("~/providers/{id}")]
        public Provider GetProviderById(int id)
        {
            Provider provider = new();
            try
            {
                provider = _appDbContext.Providers.Find(id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return provider;
        }

        [HttpGet("~/providers")]
        public List<Provider> GetAllProviders()
        {
            List<Provider> providers = new();
            try
            {
                providers = _appDbContext.Providers.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return providers;
        }

    }
}
