using AutoMapper;
using VolunteerReport.Common.DTOs.Roles;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class RoleMappingProfile: Profile
{
    public RoleMappingProfile()
    {
        CreateMap<Role, RoleDto>();
        CreateMap<CreateRoleDto, Role>();
    }
}