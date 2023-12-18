using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Persistence;

public interface IVolunteerRepository: IGenericRepository<Volunteer>
{
    Task<IEnumerable<Volunteer>> GetAllAsync(int pageNumber = 1, int pageSize = 10, CancellationToken cancellationToken = default);
    Task<int> GetCountAsync(CancellationToken cancellationToken = default);
}