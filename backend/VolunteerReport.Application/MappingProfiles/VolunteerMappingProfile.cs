using AutoMapper;
using VolunteerReport.Common.DTOs.Volunteer;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class VolunteerMappingProfile: Profile
{
    public VolunteerMappingProfile()
    {
        CreateMap<Volunteer, VolunteerDto>();
        CreateMap<CreateVolunteerDto, Volunteer>();
    }
}