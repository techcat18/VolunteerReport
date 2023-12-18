using AutoMapper;
using Microsoft.AspNetCore.Identity;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.Auth;
using VolunteerReport.Common.Exceptions.Auth;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class AuthService: IAuthService
{
    private readonly UserManager<User> _userManager;
    private readonly SignInManager<User> _signInManager;
    private readonly IUnitOfWork _unitOfWork;
    private readonly IJwtService _jwtService;
    private readonly IMapper _mapper;

    public AuthService(
        UserManager<User> userManager, 
        SignInManager<User> signInManager, 
        IUnitOfWork unitOfWork,
        IJwtService jwtService, 
        IMapper mapper)
    {
        _userManager = userManager;
        _signInManager = signInManager;
        _unitOfWork = unitOfWork;
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

        await CreateUserAsync(user, signupDto.Password);
        
        var organization = await GetOrganizationAsync(signupDto.OrganizationId);
        
        await CreateVolunteerAsync(user.Id, signupDto);
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

    private async Task<Organization?> GetOrganizationAsync(Guid organizationId = default)
    {
        var organization = await _unitOfWork
            .GetRepository<IOrganizationRepository>()
            .GetByIdAsync(organizationId);
        return organization;
    }

    private async Task CreateUserAsync(User user, string password)
    {
        var result = await _userManager.CreateAsync(user, password);

        if (!result.Succeeded)
        {
            throw new Exception(result.Errors.First().Description);
        }
    }

    private async Task CreateVolunteerAsync(Guid userId, SignupDto signupDto)
    {
        var user = await _unitOfWork.GetRepository<IUserRepository>().GetByIdAsync(userId);

        var organization = await _unitOfWork.GetRepository<IOrganizationRepository>()
            .GetByIdAsync(signupDto.OrganizationId);
        
        var volunteer = new Volunteer
        {
            Id = Guid.NewGuid(),
            UserId = user!.Id,
            OrganizationId = organization?.Id,
            HelpDirection = signupDto.HelpDirection,
            ShortInfo = signupDto.ShortInfo,
            DonationLink = signupDto.DonationLink
        };

        user.Volunteer = volunteer;
        user.VolunteerId = volunteer.Id;
        
        await _unitOfWork
            .GetRepository<IVolunteerRepository>()
            .AddAsync(volunteer);

        _unitOfWork.GetRepository<IUserRepository>().Update(user);

        await _unitOfWork.SaveChangesAsync();
    }
    
    #endregion
}