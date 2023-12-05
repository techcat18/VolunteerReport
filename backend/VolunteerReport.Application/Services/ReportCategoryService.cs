using AutoMapper;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.Report;
using VolunteerReport.Common.DTOs.ReportCategory;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class ReportCategoryService: IReportCategoryService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public ReportCategoryService(
        IUnitOfWork unitOfWork, 
        IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<IEnumerable<ReportCategoryDto>> GetReportCategoriesAsync(
        CancellationToken cancellationToken = default)
    {
        var reportCategories = await _unitOfWork.GetRepository<IReportCategoryRepository>()
            .GetAllAsync(cancellationToken);
        return _mapper.Map<IEnumerable<ReportCategoryDto>>(reportCategories);
    }

    public async Task<ReportCategoryDto?> GetReportCategoryByIdAsync(
        Guid id, 
        CancellationToken cancellationToken = default)
    {
        var reportCategory = await _unitOfWork.GetRepository<IReportCategoryRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (reportCategory is null)
        {
            throw new Exception("Report category was not found");
        }

        return _mapper.Map<ReportCategoryDto>(reportCategory);
    }

    public async Task<ReportCategoryDto> CreateReportCategoryAsync(
        CreateReportCategoryDto createReportCategoryDto,
        CancellationToken cancellationToken = default)
    {
        var reportCategory = _mapper.Map<ReportCategory>(createReportCategoryDto);

        await _unitOfWork.GetRepository<IReportCategoryRepository>().AddAsync(reportCategory, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
        
        return _mapper.Map<ReportCategoryDto>(reportCategory);
    }

    public async Task UpdateReportCategoryAsync(Guid id, UpdateReportCategoryDto updateReportCategoryDto,
        CancellationToken cancellationToken = default)
    {
        var reportCategory = await _unitOfWork.GetRepository<IReportCategoryRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (reportCategory is null)
        {
            throw new Exception("Report category was not found");
        }

        reportCategory.Name = updateReportCategoryDto.Name;
        reportCategory.Description = updateReportCategoryDto.Description;

        _unitOfWork.GetRepository<IReportCategoryRepository>().Update(reportCategory);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteReportCategoryAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var reportCategory = await _unitOfWork.GetRepository<IReportCategoryRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (reportCategory is null)
        {
            throw new Exception("Report category was not found");
        }

        _unitOfWork.GetRepository<IReportCategoryRepository>().Delete(reportCategory);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }
}