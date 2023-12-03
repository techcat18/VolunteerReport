namespace VolunteerReport.Common.Exceptions.Shared;

public class NotFoundException: Exception
{
    public NotFoundException(string message): base(message)
    {
    }
}