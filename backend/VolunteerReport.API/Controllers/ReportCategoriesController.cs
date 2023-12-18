using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Authorization.Attributes;
using VolunteerReport.Common.Constants;
using VolunteerReport.Common.DTOs.ReportCategory;

namespace VolunteerReport.API.Controllers;

[ApiController]
[Route(Constants.ApiEndpoints.ReportCategories.Base)]
public class ReportCategoriesController: ControllerBase
{
    private readonly IReportCategoryService _reportCategoryService;

    public ReportCategoriesController(IReportCategoryService reportCategoryService)
    {
        _reportCategoryService = reportCategoryService;
    }

    [HttpGet(Constants.ApiEndpoints.ReportCategories.GetAll)]
    public async Task<IActionResult> GetAll(CancellationToken cancellationToken)
    {
        var reportCategories = await _reportCategoryService.GetReportCategoriesAsync(cancellationToken);
        return Ok(reportCategories);
    }
    
    [HttpGet(Constants.ApiEndpoints.ReportCategories.GetById)]
    public async Task<IActionResult> GetById(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        var reportCategory = await _reportCategoryService.GetReportCategoryByIdAsync(id, cancellationToken);
        return Ok(reportCategory);
    }

    [HttpPost(Constants.ApiEndpoints.ReportCategories.Create)]
    public async Task<IActionResult> Create(
        [FromBody] CreateReportCategoryDto createReportCategoryDto,
        CancellationToken cancellationToken)
    {
        var reportCategory = await _reportCategoryService
            .CreateReportCategoryAsync(createReportCategoryDto, cancellationToken);
        return Ok(reportCategory);
    }

    [HttpPut(Constants.ApiEndpoints.ReportCategories.Update)]
    public async Task<IActionResult> Update(
        [FromRoute] Guid id,
        [FromBody] UpdateReportCategoryDto updateReportCategoryDto,
        CancellationToken cancellationToken)
    {
        await _reportCategoryService.UpdateReportCategoryAsync(id, updateReportCategoryDto, cancellationToken);
        return NoContent();
    }

    [HttpDelete(Constants.ApiEndpoints.ReportCategories.Delete)]
    public async Task<IActionResult> Delete(
        [FromRoute] Guid id,
        CancellationToken cancellationToken)
    {
        await _reportCategoryService.DeleteReportCategoryAsync(id, cancellationToken);
        return NoContent();
    }
}