namespace VolunteerReport.Common.Exceptions.Auth;

public class InvalidCredentialsAuthException: Exception
{
    public InvalidCredentialsAuthException() : base("Invalid email or password")
    {
    }
}