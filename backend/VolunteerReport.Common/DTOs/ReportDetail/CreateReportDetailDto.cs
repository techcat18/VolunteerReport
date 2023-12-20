namespace VolunteerReport.Common.DTOs.ReportDetail;

public class CreateReportDetailDto
{
    public double Amount { get; set; }
    public decimal Cost { get; set; }
    public Guid CategoryId { get; set; }
}