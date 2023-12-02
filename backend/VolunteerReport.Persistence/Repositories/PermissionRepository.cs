using Microsoft.EntityFrameworkCore;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class PermissionRepository: GenericRepository<Permission>, IPermissionRepository
{
    public PermissionRepository(AppDbContext context) : base(context)
    {
    }

    public async Task<IEnumerable<Permission>> GetByIdsAsync(List<Guid> ids, CancellationToken cancellationToken = default)
    {
        return await DbSet
            .Where(x => ids.Contains(x.Id))
            .ToListAsync(cancellationToken);
    }
}