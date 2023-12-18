using VolunteerReport.Common.DTOs.Volunteer;
using VolunteerReport.Common.Utility;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IVolunteerService
{
    Task<PaginatedList<VolunteerDto>> GetVolunteersAsync(int pageNumber = 1, int pageSize = 10, 
        CancellationToken cancellationToken = default);
    Task<VolunteerDto?> GetVolunteerByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<VolunteerDto> CreateVolunteerAsync(CreateVolunteerDto createVolunteerDto,
        CancellationToken cancellationToken = default);
    Task UpdateVolunteerAsync(Guid id, UpdateVolunteerDto updateVolunteerDto,
        CancellationToken cancellationToken = default);
    Task DeleteVolunteerAsync(Guid id, CancellationToken cancellationToken = default);
}