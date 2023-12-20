using AutoMapper;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.Report;
using VolunteerReport.Common.Exceptions.Volunteers;
using VolunteerReport.Common.Utility;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services
{
    public class ReportService : IReportService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public ReportService(
            IUnitOfWork unitOfWork,
            IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }

        public async Task<ReportDto?> GetReportByIdAsync(Guid id, CancellationToken cancellationToken = default)
        {
            var report = await _unitOfWork
            .GetRepository<IReportRepository>()
            .GetByIdAsync(id, cancellationToken);
            if (report is null)
            {
                throw new Exception("Report was not found");
            }

            return _mapper.Map<ReportDto>(report);
        }

        public async Task<PaginatedList<ReportDto>> GetReportsAsync(int pageNumber, int pageSize, CancellationToken cancellationToken = default)
        {
            var reports = await _unitOfWork
            .GetRepository<IReportRepository>()
            .GetAllAsync(pageNumber, pageSize, cancellationToken);
            var totalCount = await _unitOfWork
                .GetRepository<IReportRepository>()
                .GetCountAsync(cancellationToken);

            var reportDtos = _mapper.Map<IEnumerable<ReportDto>>(reports);

            return new PaginatedList<ReportDto>(reportDtos, totalCount, pageNumber, pageSize);
        }

        public async Task<IEnumerable<ReportDto>> GetReportsByVolunteerId(Guid volunteerId,
            CancellationToken cancellationToken = default)
        {
            var volunteer = await _unitOfWork.GetRepository<IVolunteerRepository>()
                .GetByIdAsync(volunteerId, cancellationToken);
            if (volunteer is null)
            {
                throw new VolunteerNotFoundException();
            }

            var reports = await _unitOfWork.GetRepository<IReportRepository>()
                .GetByVolunteerIdAsync(volunteerId, cancellationToken);
            
            return _mapper.Map<IEnumerable<ReportDto>>(reports);
        }

        public async Task<ReportDto> CreateReportAsync(CreateReportDto createReportDto, CancellationToken cancellationToken = default)
        {
            var report = _mapper.Map<Report>(createReportDto);

            await _unitOfWork.GetRepository<IReportRepository>().AddAsync(report, cancellationToken);
            await _unitOfWork.SaveChangesAsync(cancellationToken);

            foreach (var detail in createReportDto.Details)
            {
                var reportDetail = _mapper.Map<ReportDetail>(detail);
                reportDetail.ReportId = report.Id;
                await _unitOfWork.GetRepository<IReportDetailRepository>().AddAsync(reportDetail, cancellationToken);
            }

            await _unitOfWork.SaveChangesAsync(cancellationToken);

            return _mapper.Map<ReportDto>(report);
        }
        
        public async Task UpdateReportAsync(Guid id, UpdateReportDto updateReportDto, CancellationToken cancellationToken = default)
        {
            var report = await _unitOfWork
            .GetRepository<IReportRepository>()
            .GetByIdAsync(id, cancellationToken);
            if (report is null)
            {
                throw new Exception("Report was not found");
            }

            _unitOfWork.GetRepository<IReportRepository>().Update(report);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
            
            foreach (var detail in updateReportDto.Details)
            {
                var reportDetail = _mapper.Map<ReportDetail>(detail);
                reportDetail.ReportId = report.Id;
                _unitOfWork.GetRepository<IReportDetailRepository>().Update(reportDetail);
            }

            await _unitOfWork.SaveChangesAsync(cancellationToken);
        }

        public async Task DeleteReportAsync(Guid id, CancellationToken cancellationToken = default)
        {
            var report = await _unitOfWork
                .GetRepository<IReportRepository>()
                .GetByIdAsync(id, cancellationToken);
            if (report is null)
            {
                throw new Exception("Report was not found");
            }

            _unitOfWork.GetRepository<IReportRepository>().Delete(report);
            await _unitOfWork.SaveChangesAsync(cancellationToken);
        }
    }
}
