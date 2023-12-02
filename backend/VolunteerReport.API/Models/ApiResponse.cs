using System.Net;
using Newtonsoft.Json;

namespace VolunteerReport.API.Models;

public class ApiResponse
{
    [JsonProperty("statusCode")]
    private int StatusCode { get; }

    [JsonProperty("isSuccess")]
    private bool IsSuccess { get; set; }
    
    [JsonProperty("data")]
    private object Data { get; set; }

    public ApiResponse(HttpStatusCode statusCode, object data = null)
    {
        StatusCode = (int)statusCode;
        IsSuccess = IsSuccessStatusCode(StatusCode);
        Data = data;
    }

    private static bool IsSuccessStatusCode(int statusCode)
    {
        return statusCode is >= 200 and <= 399;
    }
}