namespace VolunteerReport.Domain.Entities;

public class ReportDetail: BaseEntity
{
    public double Amount { get; set; }
    public decimal Cost { get; set; }

    public Guid ReportId { get; set; }
    public Report Report { get; set; }
    public Guid CategoryId { get; set; }
    public ReportCategory Category { get; set; }
}