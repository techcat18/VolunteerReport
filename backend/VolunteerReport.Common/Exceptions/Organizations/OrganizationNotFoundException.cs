using VolunteerReport.Common.Exceptions.Shared;

namespace VolunteerReport.Common.Exceptions.Organizations;

public class OrganizationNotFoundException: NotFoundException
{
    public OrganizationNotFoundException() : base("Organization was not found")
    {
    }
}