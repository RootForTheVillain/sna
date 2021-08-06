using System;
using api.Models;
using api.Interfaces;
using System.Data.Entity;

namespace api.Tests
{
    public class MockDbContext 
    {
        public MockDbContext()
        {
            this.Providers = new MockDbSet<Provider>();
        }

        public MockDbSet<Provider> Providers { get; set; }

        public void Dispose() { }
    }
}