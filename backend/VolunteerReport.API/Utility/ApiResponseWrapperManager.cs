using System.Net;
using VolunteerReport.API.Models;

namespace VolunteerReport.API.Utility;

public static class ApiResponseWrapperManager
{
    public static ApiResponse WrapResponse(object result, HttpContext context)
    {
        var status = (HttpStatusCode)Enum.ToObject(typeof(HttpStatusCode), context.Response.StatusCode);

        var response = new ApiResponse(status, result);

        return response;
    }
}