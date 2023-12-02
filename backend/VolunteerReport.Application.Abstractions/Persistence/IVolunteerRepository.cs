using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Persistence;

public interface IVolunteerRepository: IGenericRepository<Volunteer>
{
    Task<IEnumerable<Volunteer>> GetAllAsync(int skip, int take, CancellationToken cancellationToken = default);
    Task<int> GetCountAsync(CancellationToken cancellationToken = default);
}