using Microsoft.EntityFrameworkCore;

using api.Interfaces;
using System;
using System.Threading.Tasks;

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
            // Handles Provider Visibility for the Network
            modelBuilder.Entity<NetworkProvider>().Property<bool>("IsVisible");
            modelBuilder.Entity<NetworkProvider>()
                .HasQueryFilter(m => EF.Property<bool>(m, "IsVisible") == true)
                .HasKey(x => new { x.NetworkId, x.ProviderId });

            base.OnModelCreating(modelBuilder);

        }

        public DbSet<Organization> Organizations { get; set; }
        public DbSet<Network> Networks { get; set; }
        public DbSet<Provider> Providers { get; set; }

        internal Task SaveChanges(Network network)
        {
            throw new NotImplementedException();
        }

        public virtual Task<int> SaveChangesAsync(Network network)
        {
            throw new NotImplementedException();
        }
    }
}