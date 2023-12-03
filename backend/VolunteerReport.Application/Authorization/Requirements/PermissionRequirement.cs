using Microsoft.AspNetCore.Authorization;

namespace VolunteerReport.Application.Authorization.Requirements;

public class PermissionRequirement: IAuthorizationRequirement
{
    public string Permission { get; }

    public PermissionRequirement(string permission)
    {
        Permission = permission;
    }
}