using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IJwtService
{
    Task<string> GenerateTokenAsync(User userEntity);
}