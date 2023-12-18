namespace VolunteerReport.Common.DTOs.User;

public class UpdateUserDto
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string ShortInfo { get; set; }
    public string HelpDirection { get; set; }
    public string DonationLink { get; set; }
    public DateTime BirthDate { get; set; }
    public Guid? OrganizationId { get; set; }
}