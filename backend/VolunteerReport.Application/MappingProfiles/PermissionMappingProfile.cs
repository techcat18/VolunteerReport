using AutoMapper;
using VolunteerReport.Common.DTOs.Permissions;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class PermissionMappingProfile: Profile
{
    public PermissionMappingProfile()
    {
        CreateMap<Permission, PermissionDto>();
        CreateMap<CreatePermissionDto, Permission>();
    }
}