using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.Constants;
using VolunteerReport.Common.DTOs.Roles;

namespace VolunteerReport.API.Controllers;

[ApiController]
[Route(Constants.ApiEndpoints.Roles.Base)]
public class RolesController: ControllerBase
{
    private readonly IRoleService _roleService;

    public RolesController(IRoleService roleService)
    {
        _roleService = roleService;
    }

    [HttpGet(Constants.ApiEndpoints.Roles.GetAll)]
    public async Task<IActionResult> GetAll(CancellationToken cancellationToken)
    {
        var roles = await _roleService.GetAllRolesAsync(cancellationToken);
        return Ok(roles);
    }

    [HttpGet(Constants.ApiEndpoints.Roles.GetById)]
    public async Task<IActionResult> GetById(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        var role = await _roleService.GetRoleByIdAsync(id, cancellationToken);
        return Ok(role);
    }

    [HttpPost(Constants.ApiEndpoints.Roles.Create)]
    public async Task<IActionResult> Create(
        [FromBody] CreateRoleDto createRoleDto,
        CancellationToken cancellationToken)
    {
        var role = await _roleService.CreateRoleAsync(createRoleDto, cancellationToken);
        return Ok(role);
    }

    [HttpPost(Constants.ApiEndpoints.Roles.AddPermissions)]
    public async Task<IActionResult> AddPermissions(
        [FromRoute] Guid id,
        [FromBody] AddPermissionsToRoleDto addPermissionsToRoleDto,
        CancellationToken cancellationToken)
    {
        await _roleService.AddPermissionsToRoleAsync(id, addPermissionsToRoleDto, cancellationToken);
        return NoContent();
    }

    [HttpPut(Constants.ApiEndpoints.Roles.Update)]
    public async Task<IActionResult> Update(
        [FromRoute] Guid id,
        [FromBody] UpdateRoleDto updateRoleDto,
        CancellationToken cancellationToken)
    {
        await _roleService.UpdateRoleAsync(id, updateRoleDto, cancellationToken);
        return NoContent();
    }

    [HttpDelete(Constants.ApiEndpoints.Roles.Delete)]
    public async Task<IActionResult> Delete(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        await _roleService.DeleteRoleAsync(id, cancellationToken);
        return NoContent();
    }

    [HttpDelete(Constants.ApiEndpoints.Roles.RemovePermissions)]
    public async Task<IActionResult> RemovePermissions(
        [FromRoute] Guid id,
        [FromBody] RemovePermissionFromRoleDto removePermissionsFromRoleDto,
        CancellationToken cancellationToken)
    {
        await _roleService.RemovePermissionsFromRoleAsync(id, removePermissionsFromRoleDto, cancellationToken);
        return NoContent();
    }
}