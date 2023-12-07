using AutoMapper;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.User;
using VolunteerReport.Common.Exceptions.Users;

namespace VolunteerReport.Application.Services;

public class UserService: IUserService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public UserService(
        IUnitOfWork unitOfWork, 
        IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<IEnumerable<UserDto>> GetAllUsersAsync(CancellationToken cancellationToken = default)
    {
        var users = await _unitOfWork.GetRepository<IUserRepository>().GetAllAsync(cancellationToken);
        return _mapper.Map<IEnumerable<UserDto>>(users);
    }

    public async Task<UserDto> GetUserByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var user = await _unitOfWork.GetRepository<IUserRepository>().GetByIdAsync(id, cancellationToken);
        if (user is null)
        {
            throw new UserNotFoundException();
        }

        return _mapper.Map<UserDto>(user);
    }
}