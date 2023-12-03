using VolunteerReport.Common.DTOs.Organization;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IOrganizationService
{
    Task<IEnumerable<OrganizationDto>> GetOrganizationsAsync(CancellationToken cancellationToken = default);
    Task<OrganizationDto?> GetOrganizationByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<OrganizationDto> CreateOrganizationAsync(CreateOrganizationDto createOrganizationDto,
        CancellationToken cancellationToken = default);
    Task UpdateOrganizationAsync(Guid id, UpdateOrganizationDto updateOrganizationDto,
        CancellationToken cancellationToken = default);
    Task DeleteOrganizationAsync(Guid id, CancellationToken cancellationToken = default);
}