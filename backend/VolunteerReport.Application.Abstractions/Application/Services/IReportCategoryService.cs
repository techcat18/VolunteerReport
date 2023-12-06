using VolunteerReport.Common.DTOs.ReportCategory;

namespace VolunteerReport.Application.Abstractions.Application.Services;

public interface IReportCategoryService
{
    Task<IEnumerable<ReportCategoryDto>> GetReportCategoriesAsync(CancellationToken cancellationToken = default);
    Task<ReportCategoryDto?> GetReportCategoryByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task<ReportCategoryDto> CreateReportCategoryAsync(CreateReportCategoryDto createReportCategoryDto,
        CancellationToken cancellationToken = default);
    Task UpdateReportCategoryAsync(Guid id, UpdateReportCategoryDto updateReportCategoryDto,
        CancellationToken cancellationToken = default);
    Task DeleteReportCategoryAsync(Guid id, CancellationToken cancellationToken = default);
}