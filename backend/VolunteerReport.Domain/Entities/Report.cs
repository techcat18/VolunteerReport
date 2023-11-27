namespace VolunteerReport.Domain.Entities;

public class Report: IBaseEntity
{
    public Guid Id { get; set; }
    public string Description { get; set; }
    public string Direction { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }
    
    public Guid VolunteerId { get; set; }
    public ICollection<ReportDetail> ReportDetails { get; set; }
}