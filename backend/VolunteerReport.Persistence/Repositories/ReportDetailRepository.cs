using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class ReportDetailRepository: GenericRepository<ReportDetail>, IReportDetailRepository
{
    public ReportDetailRepository(AppDbContext context) : base(context)
    {
    }
}