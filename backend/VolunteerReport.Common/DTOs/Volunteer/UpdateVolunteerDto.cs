namespace VolunteerReport.Common.DTOs.Volunteer;

public class UpdateVolunteerDto
{
    public string ShortInfo { get; set; }
    public string HelpDirection { get; set; }
    public string DonationLink { get; set; }
    public Guid? OrganizationId { get; set; }
}