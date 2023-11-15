namespace VolunteerReport.Common.DTOs.Volunteer;

public class CreateVolunteerDto
{
    public string ShortInfo { get; set; }
    public string HelpDirection { get; set; }
    public string BankUrl { get; set; }
    public Guid? OrganizationId { get; set; }
}