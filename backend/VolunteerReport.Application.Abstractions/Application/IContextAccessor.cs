namespace VolunteerReport.Application.Abstractions.Application;

public interface IContextAccessor
{
    Guid GetCurrentUserId();
}