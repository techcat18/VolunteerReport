namespace VolunteerReport.Domain.Entities;

public class Permission: IBaseEntity
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }

    public ICollection<Role> Roles { get; set; } = new List<Role>();
}