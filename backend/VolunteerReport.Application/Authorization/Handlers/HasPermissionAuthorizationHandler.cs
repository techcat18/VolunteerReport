using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;
using VolunteerReport.Application.Authorization.Requirements;
using VolunteerReport.Common.Constants;

namespace VolunteerReport.Application.Authorization.Handlers;

public class PermissionAuthorizationHandler: AuthorizationHandler<PermissionRequirement>
{
    protected override Task HandleRequirementAsync(
        AuthorizationHandlerContext context, 
        PermissionRequirement requirement)
    {
        if (context.User.Identity is null or { IsAuthenticated: false })
        {
            context.Fail();
            return Task.CompletedTask;
        }

        var userClaims = context.User.Claims.ToList();
        
        var userIdClaim = userClaims.FirstOrDefault(x => x.Type == ClaimTypes.NameIdentifier);

        if (userIdClaim is null || !Guid.TryParse(userIdClaim.Value, out _))
        {
            context.Fail();
            return Task.CompletedTask;
        }

        var permissions = userClaims
            .Where(x => x.Type == Constants.ClaimTypes.Permissions)
            .Select(x => x.Value)
            .ToList();
        
        if (permissions.Count == 0)
        {
            context.Fail();
            return Task.CompletedTask;
        }
        
        if (permissions.All(x => x != requirement.Permission))
        {
            context.Fail();
            return Task.CompletedTask;
        }

        context.Succeed(requirement);
        return Task.CompletedTask;
    }
}