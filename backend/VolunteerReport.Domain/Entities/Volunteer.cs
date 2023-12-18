namespace VolunteerReport.Domain.Entities;

public class Volunteer: IBaseEntity
{
    public Guid Id { get; set; }
    public string ShortInfo { get; set; }
    public string HelpDirection { get; set; }
    public string DonationLink { get; set; }
    public DateTime? CreatedAt { get; set; }
    public DateTime? ModifiedAt { get; set; }
    public bool IsDeleted { get; set; }
    
    public Guid? OrganizationId { get; set; }
    public Organization Organization { get; set; }
    
    public Guid UserId { get; set; }
    public User User { get; set; }
    
    public ICollection<Report> Reports { get; set; }
}