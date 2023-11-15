using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.MappingProfiles;
using VolunteerReport.Application.Services;

namespace VolunteerReport.Application;

public static class DependencyRegistrar
{
    public static void ConfigureApplicationLayerDependencies(this IServiceCollection services, IConfiguration configuration)
    {
        services.ConfigureServices();
        services.ConfigureAutomapper();
    }
    
    private static void ConfigureServices(this IServiceCollection services){
    {
        services.AddScoped<IReportCategoryService, ReportCategoryService>();
    }}
    
    private static void ConfigureAutomapper(this IServiceCollection services)
    {
        services.AddAutoMapper(typeof(ReportCategoryMappingProfile).Assembly);
    }
}