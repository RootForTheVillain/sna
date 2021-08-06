using Xunit;

using api.Models;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using api.Controllers;
using Microsoft.Extensions.Logging.Abstractions;

namespace api.Tests
{
    public class TestCustomerController
    {
        private readonly string CONNECTION_STRING = "Server=localhost; Port=5432; Username=sna-db-user; Password=p@$$w0rd; Database=sna;";
        private readonly CustomerController _controller;

        public TestCustomerController()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
                .UseNpgsql(CONNECTION_STRING)
                //.UseInMemoryDatabase(databaseName: "sna-api-test")
                .Options;

            var context = new AppDbContext(options);
            var logger = new NullLogger<ProviderController>();

            _controller = new CustomerController(context, logger);
        }


        /*[Fact]
        public void GetCustomer_ShouldReturnASingleCustomer()
        {
            Customer customer = _controller.GetCustomerById(1);
            Assert.False(customer == null, "Could not get customer id #1.");
        }

        [Fact]
        public void GetCustomers_ShouldReturnAllCustomers()
        {
            List<Customer> result = _controller.GetAllCustomers();
            Assert.True(result.Count > 1, result.Count.ToString() + " customers found.");
        }

        [Fact]
        public void GetNetworksByCustomerId_ShouldReturnNetworksForACustomer()
        {
            List<Network> result = _controller.GetNetworksByCustomerId(1);
            Assert.True(result.Count > 1, result.Count.ToString() + " customers found.");
        }*/
    }
}
