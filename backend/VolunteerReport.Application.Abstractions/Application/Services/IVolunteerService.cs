using VolunteerReport.Common.DTOs.Volunteer;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IVolunteerService
{
    Task<IEnumerable<VolunteerDto>> GetVolunteersAsync(CancellationToken cancellationToken = default);
    Task<VolunteerDto?> GetVolunteerByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<VolunteerDto> CreateVolunteerAsync(CreateVolunteerDto createVolunteerDto,
        CancellationToken cancellationToken = default);
    Task UpdateVolunteerAsync(Guid id, UpdateVolunteerDto updateVolunteerDto,
        CancellationToken cancellationToken = default);
    Task DeleteVolunteerAsync(Guid id, CancellationToken cancellationToken = default);
}