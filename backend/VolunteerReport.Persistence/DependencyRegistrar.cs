using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;
using VolunteerReport.Persistence.Repositories;

namespace VolunteerReport.Persistence;

public static class DependencyRegistrar
{
    public static void ConfigurePersistenceLayerDependencies(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.ConfigureDbContext(configuration);
        services.ConfigureIdentity();
        services.ConfigureRepositories();
        services.ConfigureUnitOfWork();
    }

    private static void ConfigureDbContext(
        this IServiceCollection services,
        IConfiguration configuration)
    {
        services.AddDbContext<AppDbContext>(options =>
        {
            var connectionString = configuration.GetConnectionString("SqlConnection");
            options.UseSqlServer(connectionString);
        });
    }
    
    private static void ConfigureIdentity(
        this IServiceCollection services)
    {
        services
            .AddIdentityCore<User>(options =>
            {
                options.User.RequireUniqueEmail = true;
            })
            .AddRoles<Role>()
            .AddEntityFrameworkStores<AppDbContext>()
            .AddDefaultTokenProviders()
            .AddRoleManager<RoleManager<Role>>()
            .AddSignInManager<SignInManager<User>>();
    }

    private static void ConfigureRepositories(this IServiceCollection services)
    {
        services.AddScoped<IReportCategoryRepository, ReportCategoryRepository>();
        services.AddScoped<IVolunteerRepository, VolunteerRepository>();
    }
    
    private static void ConfigureUnitOfWork(this IServiceCollection services)
    {
        services.AddScoped<IUnitOfWork, UnitOfWork>();
    }
}