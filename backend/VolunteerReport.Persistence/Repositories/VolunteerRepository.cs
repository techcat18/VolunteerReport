using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class VolunteerRepository: GenericRepository<Volunteer>, IVolunteerRepository
{
    public VolunteerRepository(AppDbContext context) : base(context)
    {
    }
}