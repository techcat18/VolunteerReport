using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Persistence;

public interface IPermissionRepository: IGenericRepository<Permission>
{
    Task<IEnumerable<Permission>> GetByIdsAsync(List<Guid> ids, CancellationToken cancellationToken = default);
}