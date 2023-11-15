using Microsoft.AspNetCore.Identity;

namespace VolunteerReport.Domain.Entities;

public class User: IdentityUser<Guid>
{
    public DateTime BirthDate { get; set; }
    public Volunteer Volunteer { get; set; }
}