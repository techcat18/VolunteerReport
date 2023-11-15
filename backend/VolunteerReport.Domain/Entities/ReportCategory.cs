namespace VolunteerReport.Domain.Entities;

public class ReportCategory: BaseEntity
{
    public string Name { get; set; }
    public string Description { get; set; }

    public ICollection<ReportDetail> ReportDetails { get; set; }
}