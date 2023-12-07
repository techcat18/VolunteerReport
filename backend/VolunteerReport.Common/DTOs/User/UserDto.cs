namespace VolunteerReport.Common.DTOs.User;

public class UserDto
{
    public Guid Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public Guid OrganizationId { get; set; }
    public string HelpDirection { get; set; }
    public string ShortInfo { get; set; }
}