namespace VolunteerReport.Domain.Entities;

public class ReportCategory: IBaseEntity
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }

    public ICollection<ReportDetail> ReportDetails { get; set; }
}