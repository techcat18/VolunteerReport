using Microsoft.AspNetCore.Mvc;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Common.DTOs.Report;
using VolunteerReport.Common.Constants;

namespace VolunteerReport.API.Controllers
{
    public class ReportsController : Controller
    {
        private readonly IReportService _reportService;

        public ReportsController(IReportService reportService)
        {
            _reportService = reportService;
        }

        [HttpGet(Constants.ApiEndpoints.Reports.GetAll)]
        public async Task<IActionResult> GetAll(
            [FromQuery] int pageNumber = 1,
            [FromQuery] int pageSize = 10,
            CancellationToken cancellationToken = default)
        {
            var reports = await _reportService.GetReportsAsync(pageNumber, pageSize, cancellationToken);
            return Ok(reports);
        }

        [HttpGet(Constants.ApiEndpoints.Reports.GetByVolunteerId)]
        public async Task<IActionResult> GetByVolunteerId(
            [FromRoute] Guid volunteerId,
            CancellationToken cancellationToken)
        {
            var reports = await _reportService.GetReportsByVolunteerId(volunteerId, cancellationToken);
            return Ok(reports);
        }
        
        [HttpGet(Constants.ApiEndpoints.Reports.GetById)]
        public async Task<IActionResult> GetById(
            [FromRoute] Guid id,
            CancellationToken cancellationToken)
        {
            var report = await _reportService.GetReportByIdAsync(id, cancellationToken);
            return Ok(report);
        }

        [HttpPost(Constants.ApiEndpoints.Reports.Create)]
        public async Task<IActionResult> Create(
            [FromBody] CreateReportDto createReportDto,
            CancellationToken cancellationToken)
        {
           await _reportService
                .CreateReportAsync(createReportDto, cancellationToken);
            return NoContent();
        }

        [HttpPut(Constants.ApiEndpoints.Reports.Update)]
        public async Task<IActionResult> Update(
            [FromRoute] Guid id,
            [FromBody] UpdateReportDto updateReportDto,
            CancellationToken cancellationToken)
        {
            await _reportService.UpdateReportAsync(id, updateReportDto, cancellationToken);
            return NoContent();
        }

        [HttpDelete(Constants.ApiEndpoints.Reports.Delete)]
        public async Task<IActionResult> Delete(
            [FromRoute] Guid id,
            CancellationToken cancellationToken)
        {
            await _reportService.DeleteReportAsync(id, cancellationToken);
            return NoContent();
        }
    }
}
