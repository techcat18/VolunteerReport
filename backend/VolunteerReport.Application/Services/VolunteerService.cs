using AutoMapper;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.Volunteer;
using VolunteerReport.Common.Exceptions.Organizations;
using VolunteerReport.Common.Exceptions.Volunteers;
using VolunteerReport.Common.Utility;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class VolunteerService: IVolunteerService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public VolunteerService(
        IUnitOfWork unitOfWork,
        IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<PaginatedList<VolunteerDto>> GetVolunteersAsync(
        int pageNumber = 1,
        int pageSize = 10,
        CancellationToken cancellationToken = default)
    {
        var volunteers = await _unitOfWork
            .GetRepository<IVolunteerRepository>()
            .GetAllAsync(pageNumber, pageSize, cancellationToken);
        var totalCount = await _unitOfWork
            .GetRepository<IVolunteerRepository>()
            .GetCountAsync(cancellationToken);
        
        var volunteerDtos = _mapper.Map<IEnumerable<VolunteerDto>>(volunteers);
        
        return new PaginatedList<VolunteerDto>(volunteerDtos, totalCount, pageNumber, pageSize);
    }

    public async Task<VolunteerDto?> GetVolunteerByIdAsync(
        Guid id, 
        CancellationToken cancellationToken = default)
    {
        var volunteer = await _unitOfWork
            .GetRepository<IVolunteerRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (volunteer is null)
        {
            throw new Exception("Volunteer was not found");
        }

        return _mapper.Map<VolunteerDto>(volunteer);
    }

    public async Task<VolunteerDto> CreateVolunteerAsync(
        CreateVolunteerDto createVolunteerDto, 
        CancellationToken cancellationToken = default)
    {
        var volunteer = _mapper.Map<Volunteer>(createVolunteerDto);

        await _unitOfWork.GetRepository<IVolunteerRepository>().AddAsync(volunteer, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return _mapper.Map<VolunteerDto>(volunteer);
    }

    public async Task UpdateVolunteerAsync(
        Guid id, 
        UpdateVolunteerDto updateVolunteerDto,
        CancellationToken cancellationToken = default)
    {
        var volunteer = await _unitOfWork.GetRepository<IVolunteerRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (volunteer is null)
        {
            throw new VolunteerNotFoundException();
        }

        volunteer.HelpDirection = updateVolunteerDto.HelpDirection;
        volunteer.ShortInfo = updateVolunteerDto.ShortInfo;
        volunteer.DonationLink = updateVolunteerDto.DonationLink;

        if (updateVolunteerDto.OrganizationId is not null)
        {
            var organization = await _unitOfWork.GetRepository<IOrganizationRepository>()
                .GetByIdAsync(updateVolunteerDto.OrganizationId.Value, cancellationToken);
            if (organization is null)
            {
                throw new OrganizationNotFoundException();
            }

            volunteer.OrganizationId = organization.Id;
        }

        _unitOfWork.GetRepository<IVolunteerRepository>().Update(volunteer);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteVolunteerAsync(
        Guid id, 
        CancellationToken cancellationToken = default)
    {
        var volunteer = await _unitOfWork
            .GetRepository<IVolunteerRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (volunteer is null)
        {
            throw new Exception("Volunteer was not found");
        }

        _unitOfWork.GetRepository<IVolunteerRepository>().Delete(volunteer);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }
}