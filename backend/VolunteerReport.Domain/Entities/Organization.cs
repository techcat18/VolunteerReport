namespace VolunteerReport.Domain.Entities;

public class Organization: BaseEntity
{
    public string Name { get; set; }
    public string Information { get; set; }
    public string MainDirection { get; set; }
    public string MainGoal { get; set; }

    public ICollection<Volunteer> Volunteers { get; set; }
}