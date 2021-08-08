using Microsoft.EntityFrameworkCore;

using api.Interfaces;
using System;

namespace api.Models
{
    public class AppDbContext : DbContext, IAppDbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public AppDbContext() : base()
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseLazyLoadingProxies();
            optionsBuilder.LogTo(Console.WriteLine);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<NetworkProvider>()
                    .HasKey(x => new { x.NetworkId, x.ProviderId });

            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Organization> Organizations { get; set; }
        public DbSet<Network> Networks { get; set; }
        public DbSet<Provider> Providers { get; set; }
    }
}