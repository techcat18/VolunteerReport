using VolunteerReport.Common.Exceptions.Shared;

namespace VolunteerReport.Common.Exceptions.Volunteers;

public class VolunteerNotFoundException: NotFoundException
{
    public VolunteerNotFoundException() : base("Volunteer was not found")
    {
    }
}