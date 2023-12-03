using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.Constants;
using VolunteerReport.Common.DTOs.Organization;

namespace VolunteerReport.API.Controllers;

[ApiController]
[Route(Constants.ApiEndpoints.Organizations.Base)]
public class OrganizationsController: ControllerBase
{
    private readonly IOrganizationService _organizationService;

    public OrganizationsController(IOrganizationService organizationService)
    {
        _organizationService = organizationService;
    }

    [HttpGet(Constants.ApiEndpoints.Organizations.GetAll)]
    public async Task<IActionResult> GetAll(CancellationToken cancellationToken)
    {
        var organizations = await _organizationService.GetOrganizationsAsync(cancellationToken);
        return Ok(organizations);
    }

    [HttpGet(Constants.ApiEndpoints.Organizations.GetById)]
    public async Task<IActionResult> Get(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        var organization = await _organizationService.GetOrganizationByIdAsync(id, cancellationToken);
        return Ok(organization);
    }

    [HttpPost(Constants.ApiEndpoints.Organizations.Create)]
    public async Task<IActionResult> Create(
        [FromBody] CreateOrganizationDto createOrganizationDto,
        CancellationToken cancellationToken)
    {
        var organization = await _organizationService.CreateOrganizationAsync(createOrganizationDto, cancellationToken);
        return Ok(organization);
    }

    [HttpPost(Constants.ApiEndpoints.Organizations.Update)]
    public async Task<IActionResult> Update(
        [FromRoute] Guid id,
        UpdateOrganizationDto updateOrganizationDto,
        CancellationToken cancellationToken)
    {
        await _organizationService.UpdateOrganizationAsync(id, updateOrganizationDto, cancellationToken);
        return NoContent();
    }

    [HttpDelete(Constants.ApiEndpoints.Organizations.Delete)]
    public async Task<IActionResult> Delete(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        await _organizationService.DeleteOrganizationAsync(id, cancellationToken);
        return NoContent();
    }
}