using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.MappingProfiles;
using VolunteerReport.Application.Services;
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
    }
    
    private static void ConfigureServices(this IServiceCollection services){
    {
        services.AddScoped<IReportCategoryService, ReportCategoryService>();
        services.AddScoped<IVolunteerService, VolunteerService>();
        services.AddScoped<IAuthService, AuthService>();
        services.AddScoped<IJwtService, JwtService>();
    }}
    
    private static void ConfigureAutomapper(this IServiceCollection services)
    {
        services.AddAutoMapper(typeof(ReportCategoryMappingProfile).Assembly);
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
}