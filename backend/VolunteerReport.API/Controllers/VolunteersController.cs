using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.Constants;
using VolunteerReport.Common.DTOs.Volunteer;

namespace VolunteerReport.API.Controllers;

[ApiController]
[Route(Constants.ApiEndpoints.Volunteers.Base)]
public class VolunteersController: ControllerBase
{
    private readonly IVolunteerService _volunteerService;

    public VolunteersController(IVolunteerService volunteerService)
    {
        _volunteerService = volunteerService;
    }
    
    [HttpGet(Constants.ApiEndpoints.Volunteers.GetAll)]
    public async Task<IActionResult> GetAll(
        [FromQuery] int pageNumber = 1,
        [FromQuery] int pageSize = 10,
        CancellationToken cancellationToken = default)
    {
        var volunteers = await _volunteerService.GetVolunteersAsync(pageNumber, pageSize, cancellationToken);
        return Ok(volunteers);
    }
    
    [HttpGet(Constants.ApiEndpoints.Volunteers.GetById)]
    public async Task<IActionResult> GetById(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        var volunteer = await _volunteerService.GetVolunteerByIdAsync(id, cancellationToken);
        return Ok(volunteer);
    }

    [HttpPost(Constants.ApiEndpoints.Volunteers.Create)]
    public async Task<IActionResult> Create(
        [FromBody] CreateVolunteerDto createVolunteerDto,
        CancellationToken cancellationToken)
    {
        var volunteer = await _volunteerService
            .CreateVolunteerAsync(createVolunteerDto, cancellationToken);
        return Ok(volunteer);
    }

    [HttpPut(Constants.ApiEndpoints.Volunteers.Update)]
    public async Task<IActionResult> Update(
        [FromRoute] Guid id,
        [FromBody] UpdateVolunteerDto updateVolunteerDto,
        CancellationToken cancellationToken)
    {
        await _volunteerService.UpdateVolunteerAsync(id, updateVolunteerDto, cancellationToken);
        return NoContent();
    }

    [HttpDelete(Constants.ApiEndpoints.Volunteers.Delete)]
    public async Task<IActionResult> Delete(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        await _volunteerService.DeleteVolunteerAsync(id, cancellationToken);
        return NoContent();
    }
}