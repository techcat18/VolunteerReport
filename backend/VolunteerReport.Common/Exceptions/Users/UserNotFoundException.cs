using VolunteerReport.Common.Exceptions.Shared;

namespace VolunteerReport.Common.Exceptions.Users;

public class UserNotFoundException: NotFoundException
{
    public UserNotFoundException() : base("User was not found")
    {
    }
}