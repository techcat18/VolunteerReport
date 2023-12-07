using System.Security.Claims;
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
        var idClaim = _httpContextAccessor.HttpContext?.User.Claims.FirstOrDefault(x =>
            x.Type == ClaimTypes.NameIdentifier);
        if (idClaim is null)
        {
            throw new Exception("Not authorized");
        }

        return Guid.Parse(idClaim.Value);
    }
}