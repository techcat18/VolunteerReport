using Microsoft.AspNetCore.Identity;

namespace VolunteerReport.Domain.Entities;

public class Role: IdentityRole<Guid>, IBaseEntity
{
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }

    public IList<Permission> Permissions { get; set; } = new List<Permission>();
}