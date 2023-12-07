using Microsoft.AspNetCore.Http;
using VolunteerReport.Application.Abstractions.Application;

namespace VolunteerReport.Application.Utility;

public class ContextAccessor: IContextAccessor
{
    private readonly IHttpContextAccessor _httpContextAccessor;

    public ContextAccessor(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;
    }

    public Guid GetCurrentUserId()
    {
        var name = _httpContextAccessor.HttpContext.User.Identity.Name;
        return Guid.NewGuid();
    }
}