namespace VolunteerReport.Domain.Entities;

public class Volunteer: BaseEntity
{
    public string ShortInfo { get; set; }
    public string HelpDirection { get; set; }
    public string BankUrl { get; set; }
    
    public Guid? OrganizationId { get; set; }
    public Organization Organization { get; set; }
    public User User { get; set; }
    public ICollection<Report> Reports { get; set; }
}