namespace VolunteerReport.Domain.Entities;

public interface IBaseEntity
{
    public Guid Id { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }
}