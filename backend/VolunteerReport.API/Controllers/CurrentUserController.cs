using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.Constants;

namespace VolunteerReport.API.Controllers;

//[Authorize]
[ApiController]
[Route(Constants.ApiEndpoints.CurrentUser.Base)]
public class CurrentUserController: ControllerBase
{
    private readonly IUserService _userService;
    private readonly IContextAccessor _contextAccessor;

    public CurrentUserController(
        IUserService userService, 
        IContextAccessor contextAccessor)
    {
        _userService = userService;
        _contextAccessor = contextAccessor;
    }

    [HttpGet(Constants.ApiEndpoints.CurrentUser.Info)]
    public async Task<IActionResult> GetInfo(CancellationToken cancellationToken)
    {
        var user = await _userService.GetUserByIdAsync(_contextAccessor.GetCurrentUserId(), cancellationToken);
        return Ok(user);
    }
}