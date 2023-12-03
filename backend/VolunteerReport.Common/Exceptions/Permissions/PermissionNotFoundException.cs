using VolunteerReport.Common.Exceptions.Shared;

namespace VolunteerReport.Common.Exceptions.Permissions;

public class PermissionNotFoundException: NotFoundException
{
    public PermissionNotFoundException() : base("Permission was not found")
    {
    }
}