using Microsoft.AspNetCore.Identity;

namespace VolunteerReport.Domain.Entities;

public class User: IdentityUser<Guid>, IBaseEntity
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public DateTime BirthDate { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }
    
    public Guid? VolunteerId { get; set; }
    public Volunteer Volunteer { get; set; }
}