using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class ReportCategoryRepository: GenericRepository<ReportCategory>, IReportCategoryRepository
{
    public ReportCategoryRepository(AppDbContext context) : base(context)
    {
    }
}