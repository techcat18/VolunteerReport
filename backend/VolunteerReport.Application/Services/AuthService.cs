using AutoMapper;
using Microsoft.AspNetCore.Identity;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.DTOs.Auth;
using VolunteerReport.Common.Exceptions.Auth;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class AuthService: IAuthService
{
    private readonly UserManager<User> _userManager;
    private readonly SignInManager<User> _signInManager;
    private readonly IJwtService _jwtService;
    private readonly IMapper _mapper;

    public AuthService(
        UserManager<User> userManager, 
        SignInManager<User> signInManager, 
        IJwtService jwtService, 
        IMapper mapper)
    {
        _userManager = userManager;
        _signInManager = signInManager;
        _jwtService = jwtService;
        _mapper = mapper;
    }

    public async Task<AuthResponseDto> LoginAsync(LoginDto loginDto)
    {
        var user = await _userManager.FindByEmailAsync(loginDto.Email);
        if (user is null)
        {
            throw new InvalidCredentialsAuthException();
        }

        await CheckPasswordSigninAsync(user, loginDto.Password);
        
        //TODO: Get permissions

        var jwtAccessToken = await GenerateTokenAsync(user);

        return new AuthResponseDto
        {
            AccessToken = jwtAccessToken
        };
    }

    public async Task SignupAsync(SignupDto signupDto)
    {
        var user = _mapper.Map<User>(signupDto);

        var result = await _userManager.CreateAsync(user, signupDto.Password);

        if (!result.Succeeded)
        {
            throw new Exception(result.Errors.First().Description);
        }
    }
    
    #region Private methods
    
    private async Task<string> GenerateTokenAsync(
        User user)
    {
        var jwtAccessToken = await _jwtService.GenerateTokenAsync(user);
        return jwtAccessToken;
    }
    
    private async Task CheckPasswordSigninAsync(User user, string password)
    {
        var result = await _signInManager.CheckPasswordSignInAsync(user, password, false);
        if (!result.Succeeded)
        {
            throw new InvalidCredentialsAuthException();
        }
    }
    
    #endregion
}