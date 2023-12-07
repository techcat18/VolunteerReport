using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Persistence
{
    public interface IReportRepository : IGenericRepository<Report>
    {
        Task<IEnumerable<Report>> GetAllAsync(int skip, int take, CancellationToken cancellationToken = default);
        Task<int> GetCountAsync(CancellationToken cancellationToken = default);
    }
}
