using Xunit;

using api.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using api.Controllers;
using Microsoft.Extensions.Logging.Abstractions;
using System.Configuration;

namespace api.Tests
{
    public class TestProviderController
    {
        private readonly string CONNECTION_STRING = "Server=localhost; Port=5432; Username=sna-db-user; Password=p@$$w0rd; Database=sna;";
        private readonly ProviderController _controller;

        public TestProviderController()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
                .UseNpgsql(CONNECTION_STRING)
                //.UseInMemoryDatabase(databaseName: "sna-api-test")
                .Options;

            var context = new AppDbContext(options);
            var logger = new NullLogger<ProviderController>();

            _controller = new ProviderController(context, logger);
        }


        [Fact]
        public void GetProvider_ShouldReturnASingleProvider()
        {
            Provider provider = _controller.GetProviderById(1);
            Assert.True(provider == null, "Could not get provider id #1.");
        }

        [Fact]
        public void GetProviders_ShouldReturnAllProviders()
        {
            List<Provider> result = _controller.GetAllProviders();
            Assert.True(result.Count == 0, "No providers found.");
        }
    }
}
