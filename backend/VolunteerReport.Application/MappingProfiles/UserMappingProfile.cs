using AutoMapper;
using VolunteerReport.Common.DTOs.User;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.MappingProfiles;

public class UserMappingProfile: Profile
{
    public UserMappingProfile()
    {
        CreateMap<User, UserDto>()
            .ForMember(dest => dest.VolunteerId, src => src.MapFrom(opt => opt.Volunteer!.Id))
            .ForMember(dest => dest.OrganizationId, src => src.MapFrom(opt => opt.Volunteer!.OrganizationId))
            .ForMember(dest => dest.HelpDirection, src => src.MapFrom(opt => opt.Volunteer!.HelpDirection))
            .ForMember(dest => dest.ShortInfo, src => src.MapFrom(opt => opt.Volunteer!.ShortInfo))
            .ForMember(dest => dest.DonationLink, src => src.MapFrom(opt => opt.Volunteer.DonationLink));
    }
}