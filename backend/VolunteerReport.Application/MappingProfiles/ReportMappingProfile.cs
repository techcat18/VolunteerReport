using AutoMapper;
using VolunteerReport.Common.DTOs.Report;
using VolunteerReport.Common.DTOs.ReportDetail;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class ReportMappingProfile: Profile
{
    public ReportMappingProfile()
    {
        CreateMap<Report, ReportDto>();
        CreateMap<CreateReportDto, Report>();
        CreateMap<ReportDetail, ReportDetailDto>();
        CreateMap<CreateReportDetailDto, ReportDetail>();
    }
}