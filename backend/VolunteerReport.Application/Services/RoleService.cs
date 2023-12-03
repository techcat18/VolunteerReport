using AutoMapper;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.Roles;
using VolunteerReport.Common.Exceptions.Permissions;
using VolunteerReport.Common.Exceptions.Roles;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class RoleService: IRoleService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public RoleService(
        IUnitOfWork unitOfWork, 
        IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<IEnumerable<RoleDto>> GetAllRolesAsync(CancellationToken cancellationToken = default)
    {
        var roles = await _unitOfWork.GetRepository<IRoleRepository>().GetAllAsync(cancellationToken);
        return _mapper.Map<IEnumerable<RoleDto>>(roles);
    }

    public async Task<RoleDto?> GetRoleByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var role = await GetRoleInternalAsync(id, cancellationToken);
        return _mapper.Map<RoleDto>(role);
    }

    public async Task<RoleDto> CreateRoleAsync(CreateRoleDto createRoleDto, CancellationToken cancellationToken = default)
    {
        var role = _mapper.Map<Role>(createRoleDto);

        await _unitOfWork.GetRepository<IRoleRepository>().AddAsync(role, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return _mapper.Map<RoleDto>(role);
    }

    public async Task UpdateRoleAsync(Guid id, UpdateRoleDto updateRoleDto, CancellationToken cancellationToken = default)
    {
        var role = await GetRoleInternalAsync(id, cancellationToken);

        role.Name = updateRoleDto.Name;

        _unitOfWork.GetRepository<IRoleRepository>().Update(role);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteRoleAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var role = await GetRoleInternalAsync(id, cancellationToken);
        
        _unitOfWork.GetRepository<IRoleRepository>().Delete(role);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }

    public async Task AddPermissionsToRoleAsync(
        Guid roleId, 
        AddPermissionsToRoleDto addPermissionsToRoleDto,
        CancellationToken cancellationToken = default)
    {
        var role = await GetRoleInternalAsync(roleId, cancellationToken);
        var permissions = await GetPermissionsInternalAsync(addPermissionsToRoleDto.PermissionIds, cancellationToken);

        foreach (var permission in permissions)
        {
            if (role.Permissions.All(x => x.Id != permission.Id))
            {
                role.Permissions.Add(permission);
            }
        }

        _unitOfWork.GetRepository<IRoleRepository>().Update(role);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }
    
    public async Task RemovePermissionsFromRoleAsync(
        Guid roleId, 
        RemovePermissionFromRoleDto removePermissionFromRoleDto,
        CancellationToken cancellationToken = default)
    {
        var role = await GetRoleInternalAsync(roleId, cancellationToken);
        var permissions = await GetPermissionsInternalAsync(removePermissionFromRoleDto.PermissionIds, cancellationToken);

        foreach (var permission in permissions)
        {
            var rolePermission = role.Permissions.FirstOrDefault(x => x.Id == permission.Id);
            if (rolePermission is not null)
            {
                role.Permissions.Remove(rolePermission);
            }
        }

        _unitOfWork.GetRepository<IRoleRepository>().Update(role);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }
    
    #region Private methods

    private async Task<Role> GetRoleInternalAsync(Guid id, CancellationToken cancellationToken)
    {
        var role = await _unitOfWork.GetRepository<IRoleRepository>().GetByIdAsync(id, cancellationToken);
        if (role is null)
        {
            throw new RoleNotFoundException();
        }

        return role;
    }

    private async Task<IEnumerable<Permission>> GetPermissionsInternalAsync(
        List<Guid> ids,
        CancellationToken cancellationToken)
    {
        var permissions =
            (await _unitOfWork.GetRepository<IPermissionRepository>().GetByIdsAsync(ids, cancellationToken)).ToList();
        if (permissions.Count != ids.Count)
        {
            throw new PermissionNotFoundException();
        }

        return permissions;
    }

    #endregion
}