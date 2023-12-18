using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories
{
    public class ReportRepository : GenericRepository<Report>, IReportRepository
    {
        public ReportRepository(AppDbContext context) : base(context)
        {
        }

        public async Task<IEnumerable<Report>> GetAllAsync(int skip, int take, CancellationToken cancellationToken = default)
        {
            return await DbSet
            .Skip(skip)
            .Take(take)
            .ToListAsync(cancellationToken);
        }

        public async Task<IEnumerable<Report>> GetByVolunteerIdAsync(Guid volunteerId, CancellationToken cancellationToken = default)
        {
            return await DbSet
                .Where(x => x.VolunteerId == volunteerId)
                .ToListAsync(cancellationToken);
        }

        public async Task<int> GetCountAsync(CancellationToken cancellationToken = default)
        {
            return await DbSet.CountAsync(cancellationToken);
        }
    }
}
