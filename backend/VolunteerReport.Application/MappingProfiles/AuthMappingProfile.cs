using AutoMapper;
using VolunteerReport.Common.DTOs.Auth;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class AuthMappingProfile: Profile
{
    public AuthMappingProfile()
    {
        CreateMap<SignupDto, User>()
            .ForMember(dest => dest.UserName, src => src.MapFrom(opt => opt.Email));
    }
}