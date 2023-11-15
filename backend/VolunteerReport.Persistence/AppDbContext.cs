using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence;

public class AppDbContext: IdentityDbContext<User, Role, Guid>
{
    public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
    {
    }

    public DbSet<Volunteer> Volunteers { get; set; }
    public DbSet<Organization> Organizations { get; set; }
    public DbSet<Report> Reports { get; set; }
    public DbSet<ReportCategory> ReportCategories { get; set; }
    public DbSet<ReportDetail> ReportDetails { get; set; }
    
    protected override void OnModelCreating(ModelBuilder builder)
    {
        base.OnModelCreating(builder);
        
        builder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);
    }
    
    public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        HandleSoftDelete();
        AuditEntities();

        return base.SaveChangesAsync(cancellationToken);
    }
    
    private void AuditEntities()
    {
        var entries = ChangeTracker
            .Entries()
            .Where(e => e.State is EntityState.Added or EntityState.Modified);

        foreach (var entityEntry in entries)
        {
            var auditEntity = (BaseEntity)entityEntry.Entity;
            auditEntity.ModifiedAt = DateTime.UtcNow;

            if (entityEntry.State == EntityState.Added)
            {
                auditEntity.CreatedAt = DateTime.UtcNow;
            }
        }
    }

    private void HandleSoftDelete()
    {
        var entries = ChangeTracker
            .Entries()
            .Where(e => e.State == EntityState.Deleted);

        foreach (var entityEntry in entries)
        {
            var auditEntity = (BaseEntity)entityEntry.Entity;
            auditEntity.IsDeleted = true;
            entityEntry.State = EntityState.Modified;
        }
    }
}