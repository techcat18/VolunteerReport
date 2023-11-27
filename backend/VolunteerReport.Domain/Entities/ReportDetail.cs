namespace VolunteerReport.Domain.Entities;

public class ReportDetail: IBaseEntity
{
    public Guid Id { get; set; }
    public double Amount { get; set; }
    public decimal Cost { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }

    public Guid ReportId { get; set; }
    public Report Report { get; set; }
    public Guid CategoryId { get; set; }
    public ReportCategory Category { get; set; }
}