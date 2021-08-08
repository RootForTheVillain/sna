using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace api.Controllers
{
    public class OrganizationController : Controller
    {
        private readonly AppDbContext _appDbContext;
        private readonly ILogger<NetworkController> _logger;

        public OrganizationController(AppDbContext appDbContext, ILogger<NetworkController> logger)
        {
            _appDbContext = appDbContext;
            _logger = logger;
        }

        [HttpGet("~/organizations")]
        public List<Organization> GetAllOrganizations()
        {
            List<Organization> organizations = new();
            try
            {
                organizations = _appDbContext.Organizations.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            return organizations;
        }

        [HttpGet("~/organizations/{id}")]
        public Organization GetOrganizationById(int id)
        {
            Organization organization = null;
            try
            {
                organization = _appDbContext.Organizations.Find(id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }

            if (organization == null) {
                NotFound();
            }
            return organization;
        }

        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }
    }
}
