using Newtonsoft.Json;
using VolunteerReport.API.Utility;

namespace VolunteerReport.API.Middleware;

/// <summary>
/// Middleware for modifying the response object
/// </summary>
public class ApiResponseWrapperMiddleware
{
    private readonly RequestDelegate _next;

    public ApiResponseWrapperMiddleware(RequestDelegate next)
    {
        _next = next;
    }
    
    public async Task Invoke(HttpContext context)
    {
        var currentBody = context.Response.Body;

        using var memoryStream = new MemoryStream();
        context.Response.Body = memoryStream;
        
        await _next(context);

        context.Response.Body = currentBody;
        
        memoryStream.Seek(0, SeekOrigin.Begin);

        if (context.Response.StatusCode == StatusCodes.Status204NoContent)
        {
            return;
        }
        
        switch (context.Response.ContentType)
        {
            case "application/json; charset=utf-8": 
            case "application/json":
            {
                var readToEnd = await new StreamReader(memoryStream).ReadToEndAsync();

                var result = JsonConvert.DeserializeObject(readToEnd);

                var response = ApiResponseWrapperManager.WrapResponse(result, context);
                var serializedResponse = JsonConvert.SerializeObject(response);

                await context.Response.WriteAsync(serializedResponse);
                break;
            }
            default:
                await memoryStream.CopyToAsync(currentBody);
                break;
        }
    }
}

public static partial class AppBuilderExtensions
{
    public static IApplicationBuilder UseApiResponseWrapperMiddleware(this IApplicationBuilder app)
    {
        return app.UseMiddleware<ApiResponseWrapperMiddleware>();
    }
}