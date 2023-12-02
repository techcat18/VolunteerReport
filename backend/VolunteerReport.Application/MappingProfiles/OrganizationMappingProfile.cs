using AutoMapper;
using VolunteerReport.Common.DTOs.Organization;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class OrganizationMappingProfile: Profile
{
    public OrganizationMappingProfile()
    {
        CreateMap<Organization, OrganizationDto>();
        CreateMap<CreateOrganizationDto, Organization>();
    }
}