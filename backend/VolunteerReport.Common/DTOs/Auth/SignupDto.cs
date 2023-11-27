namespace VolunteerReport.Common.DTOs.Auth;

public class SignupDto
{
    public string Email { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public DateTime BirthDate { get; set; }
    public string Password { get; set; }
}