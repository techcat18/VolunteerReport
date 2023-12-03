using VolunteerReport.Common.DTOs.Roles;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IRoleService
{
    Task<IEnumerable<RoleDto>> GetAllRolesAsync(CancellationToken cancellationToken = default);
    Task<RoleDto?> GetRoleByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<RoleDto> CreateRoleAsync(CreateRoleDto createRoleDto, CancellationToken cancellationToken = default);
    Task UpdateRoleAsync(Guid id, UpdateRoleDto updateRoleDto, CancellationToken cancellationToken = default);
    Task DeleteRoleAsync(Guid id, CancellationToken cancellationToken = default);
    Task AddPermissionsToRoleAsync(Guid roleId, AddPermissionsToRoleDto addPermissionsToRoleDto, CancellationToken cancellationToken = default);
    Task RemovePermissionsFromRoleAsync(Guid roleId, RemovePermissionFromRoleDto removePermissionFromRoleDto, CancellationToken cancellationToken = default);
}