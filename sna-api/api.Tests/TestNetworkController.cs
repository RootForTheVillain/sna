using System;
using System.Collections.Generic;
using api.Controllers;
using api.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging.Abstractions;
using Xunit;

namespace api.Tests
{
    public class TestNetworkController
    {
        private readonly string CONNECTION_STRING = "Server=localhost; Port=5432; Username=sna-db-user; Password=p@$$w0rd; Database=sna;";
        private readonly NetworkController _controller;
        private AppDbContext _context;

        public TestNetworkController()
        {
            var options = new DbContextOptionsBuilder<AppDbContext>()
                .UseNpgsql(CONNECTION_STRING)
                .Options;

            _context = new AppDbContext(options);
            var logger = new NullLogger<NetworkController>();

            _controller = new NetworkController(_context, logger);
        }

        [Fact]
        public void GetAllNetworks_ShouldReturnAllNetworks()
        {
            List<Network> networks = _controller.GetAllNetworks();
            Assert.True(networks.Count == 0, "Could not get any networks.");
        }
    
        [Fact]
        public void GetNetworkById_ShouldReturnASingleNetwork()
        {
            Network network = _controller.GetNetworkById(1);
            Assert.True(network == null, "Could not find  network id #1.");
        }

        [Fact]
        public void AddProviderToNetwork_ShouldReturn()
        {
            int endLength = 0;
            int startLength = _context.Networks.Find(1).NetworkProviders.Count;

            Provider provider = new();
            provider.FirstName = "Dr. " + Guid.NewGuid().ToString().Substring(0, 5);

            endLength = _context.Networks.Find(1).NetworkProviders.Count;

            Assert.True(endLength != startLength + 1, "Could not add provider for network id #1.");
        }

        /*[Fact]
        public void GetProvidersByNetworkId_ShouldReturnAllProvidersForNetwork()
        {
            List<NetworkProvider> networkProviders = _controller.GetProvidersByNetworkId(1);
            Assert.True(networkProviders.Count == 0, "Could not get any providers for Network id #1.");
        }*/
    }
}
