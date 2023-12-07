using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using VolunteerReport.Application.Abstractions.Application;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Authorization.Handlers;
using VolunteerReport.Application.Authorization.Policies;
using VolunteerReport.Application.MappingProfiles;
using VolunteerReport.Application.Services;
using VolunteerReport.Application.Utility;
using VolunteerReport.Common.Options;

namespace VolunteerReport.Application;

public static class DependencyRegistrar
{
    public static void ConfigureApplicationLayerDependencies(this IServiceCollection services, IConfiguration configuration)
    {
        services.ConfigureServices();
        services.ConfigureAutomapper();
        services.ConfigureJwtAuthentication(configuration);
        services.ConfigureOptions();
        services.ConfigureAuthorizationHandlers();
        services.AddContextAccessor();
    }
    
    private static void ConfigureServices(this IServiceCollection services){
    {
        services.AddScoped<IReportCategoryService, ReportCategoryService>();
        services.AddScoped<IVolunteerService, VolunteerService>();
        services.AddScoped<IAuthService, AuthService>();
        services.AddScoped<IJwtService, JwtService>();
        services.AddScoped<IOrganizationService, OrganizationService>();
    }}
    
    private static void ConfigureAutomapper(this IServiceCollection services)
    {
        services.AddAutoMapper(typeof(ReportCategoryMappingProfile).Assembly);
    }

    private static void AddContextAccessor(this IServiceCollection services)
    {
        services.AddHttpContextAccessor();
        services.AddScoped<IContextAccessor, ContextAccessor>();
    }
    
    private static void ConfigureJwtAuthentication(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services
            .AddAuthentication(options =>
            {
                options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            })
            .AddJwtBearer(options =>
            {
                var validIssuer = configuration["JwtSettings:Issuer"];
                var validAudience = configuration["JwtSettings:Audience"];
                var secret = configuration["JwtSettings:Secret"];
                
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = validIssuer,
                    ValidAudience = validAudience,
                    IssuerSigningKey = new SymmetricSecurityKey
                        (Encoding.UTF8.GetBytes(secret)),
                };
                
                options.Events = new JwtBearerEvents
                {
                    OnAuthenticationFailed = context =>
                    {
                        Console.WriteLine(context.Exception);
                        return Task.CompletedTask;
                    },
                };
            });
    }

    private static void ConfigureOptions(this IServiceCollection services)
    {
        services.ConfigureOptions<JwtOptionsSetup>();
    }
    
    private static void ConfigureAuthorizationHandlers(this IServiceCollection services)
    {
        services.AddSingleton<IAuthorizationPolicyProvider, PermissionAuthorizationPolicyProvider>();
        services.AddScoped<IAuthorizationHandler, PermissionAuthorizationHandler>();
    }
}