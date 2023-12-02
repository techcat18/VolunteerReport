using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class OrganizationRepository: GenericRepository<Organization>, IOrganizationRepository
{
    public OrganizationRepository(AppDbContext context) : base(context)
    {
    }
}