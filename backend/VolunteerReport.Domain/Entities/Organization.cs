namespace VolunteerReport.Domain.Entities;

public class Organization: IBaseEntity
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Information { get; set; }
    public string MainDirection { get; set; }
    public string MainGoal { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }

    public ICollection<Volunteer> Volunteers { get; set; }
}