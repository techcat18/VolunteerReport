using VolunteerReport.Common.DTOs.Organization;
using VolunteerReport.Common.DTOs.Report;

namespace VolunteerReport.Common.DTOs.Volunteer;

public class VolunteerDto
{
    public Guid Id { get; set; }
    public string ShortInfo { get; set; }
    public string HelpDirection { get; set; }
    public string DonationLink { get; set; }
    public Guid UserId { get; set; }
    public OrganizationDto Organization { get; set; }
    public ICollection<ReportDto> Reports { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
}