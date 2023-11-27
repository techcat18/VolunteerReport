using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.Constants;
using VolunteerReport.Common.DTOs.Auth;

namespace VolunteerReport.API.Controllers;

/// <summary>
/// Controller for managing authentication
/// </summary>
[Authorize]
[ApiController]
[Route(Constants.ApiEndpoints.Auth.Base)]
public class AuthController: ControllerBase
{
   private readonly IAuthService _authService;

   public AuthController(
      IAuthService authService)
   {
      _authService = authService;
   }

   [AllowAnonymous]
   [HttpPost(Constants.ApiEndpoints.Auth.Login)]
   public async Task<IActionResult> Login(LoginDto loginDto)
   {
      var jwtTokenResponse = await _authService.LoginAsync(loginDto);
      return Ok(jwtTokenResponse);
   }

   [AllowAnonymous]
   [HttpPost(Constants.ApiEndpoints.Auth.Signup)]
   public async Task<IActionResult> Signup(SignupDto signupDto)
   {
      await _authService.SignupAsync(signupDto);
      return NoContent();
   }
}