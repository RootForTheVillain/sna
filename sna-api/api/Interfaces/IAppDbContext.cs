using System;
using Microsoft.EntityFrameworkCore;
using api.Models;

namespace api.Interfaces
{
    public interface IAppDbContext : IDisposable
    {
        public DbSet<Network> Networks { get; set; }
        public DbSet<Provider> Providers { get; set; }
    }
}
