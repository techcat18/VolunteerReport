using Microsoft.EntityFrameworkCore;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class VolunteerRepository: GenericRepository<Volunteer>, IVolunteerRepository
{
    public VolunteerRepository(AppDbContext context) : base(context)
    {
    }

    public async Task<IEnumerable<Volunteer>> GetAllAsync(
        int skip,
        int take,
        CancellationToken cancellationToken = default)
    {
        return await DbSet
            .Skip(skip)
            .Take(take)
            .ToListAsync(cancellationToken);
    }

    public async Task<int> GetCountAsync(CancellationToken cancellationToken = default)
    {
        return await DbSet.CountAsync(cancellationToken);
    }
}