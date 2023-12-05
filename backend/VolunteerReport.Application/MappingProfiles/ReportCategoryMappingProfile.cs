﻿using AutoMapper;
using VolunteerReport.Common.DTOs.ReportCategory;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class ReportCategoryMappingProfile: Profile
{
    public ReportCategoryMappingProfile()
    {
        CreateMap<ReportCategory, ReportCategoryDto>();
        CreateMap<CreateReportCategoryDto, ReportCategory>();
    }
}