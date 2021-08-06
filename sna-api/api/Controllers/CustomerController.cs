using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using api.Models;
using api.Interfaces;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CustomerController : ControllerBase
    {
        private readonly IAppDbContext _appDbContext = new AppDbContext();
        private readonly ILogger<ProviderController> _logger;

        public CustomerController(IAppDbContext appDbContext, ILogger<ProviderController> logger)
        {
            _appDbContext = appDbContext;
            _logger = logger;
        }

        [HttpGet("~/customer")]
        public Customer GetCustomer()
        {
            Customer customer = new();
            try
            {
                customer = _appDbContext.Customers.FirstOrDefault();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return customer;
        }

        /**
         * If we go isolated tenants, URLs get simpler and queries get smaller
         */

        [HttpGet("~/customers")]
        public Customer GetCustomerById([FromQuery] int id, [FromServices] IWebHostEnvironment env)
        {
            Customer customer = new();
            try
            {
                if (env.IsDevelopment())
                {
                    customer = _appDbContext.Customers.Find(id);
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return customer;
        }

        /*[HttpGet("~/customers")]
        public List<Customer> GetAllCustomers()
        {
            List<Customer> customers = new();
            try
            {
                customers = _appDbContext.Customers.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return customers;
        }*/
    }
}
