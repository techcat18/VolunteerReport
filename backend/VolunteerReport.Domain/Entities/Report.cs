namespace VolunteerReport.Domain.Entities;

public class Report: BaseEntity
{
    public string Description { get; set; }
    public string Direction { get; set; }
    public Guid VolunteerId { get; set; }

    public ICollection<ReportDetail> ReportDetails { get; set; }
}