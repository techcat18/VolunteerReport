using VolunteerReport.Common.Exceptions.Shared;

namespace VolunteerReport.Common.Exceptions.Roles;

public class RoleNotFoundException: NotFoundException
{
    public RoleNotFoundException() : base("Role was not found")
    {
    }
}