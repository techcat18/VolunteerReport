using VolunteerReport.Common.DTOs.Auth;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IAuthService
{
    Task<AuthResponseDto> LoginAsync(LoginDto loginDto);
    Task SignupAsync(SignupDto signupDto);
}