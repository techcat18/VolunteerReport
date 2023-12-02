using Microsoft.AspNetCore.Authorization;

namespace VolunteerReport.Application.Authorization.Attributes;

public class HasPermissionAttribute: AuthorizeAttribute
{
    public HasPermissionAttribute(string permission) : base(permission)
    {
    }
}