using VolunteerReport.Common.DTOs.Report;
using VolunteerReport.Common.Utility;

namespace VolunteerReport.Application.Abstractions.Application.Services
{
    public interface IReportService
    {
        Task<PaginatedList<ReportDto>> GetReportsAsync(int pageNumber, int pageSize, CancellationToken cancellationToken = default);
        Task<ReportDto?> GetReportByIdAsync(Guid id, CancellationToken cancellationToken = default);
        Task<ReportDto> CreateReportAsync(CreateReportDto createReportDto,
            CancellationToken cancellationToken = default);
        Task UpdateReportAsync(Guid id, UpdateReportDto updateReportDto,
            CancellationToken cancellationToken = default);
        Task DeleteReportAsync(Guid id, CancellationToken cancellationToken = default);
    }
}
