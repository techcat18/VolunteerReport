using AutoMapper;
using VolunteerReport.Application.Abstractions.Application.Services;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Common.DTOs.Organization;
using VolunteerReport.Common.Exceptions.Organizations;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Services;

public class OrganizationService: IOrganizationService
{
    private readonly IUnitOfWork _unitOfWork;
    private readonly IMapper _mapper;

    public OrganizationService(
        IUnitOfWork unitOfWork, 
        IMapper mapper)
    {
        _unitOfWork = unitOfWork;
        _mapper = mapper;
    }

    public async Task<IEnumerable<OrganizationDto>> GetOrganizationsAsync(CancellationToken cancellationToken = default)
    {
        var organizations = await _unitOfWork.GetRepository<IOrganizationRepository>().GetAllAsync(cancellationToken);
        return _mapper.Map<IEnumerable<OrganizationDto>>(organizations);
    }

    public async Task<OrganizationDto?> GetOrganizationByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var organization = await GetOrganizationInternalAsync(id, cancellationToken);
        return _mapper.Map<OrganizationDto>(organization);
    }

    public async Task<OrganizationDto> CreateOrganizationAsync(CreateOrganizationDto createOrganizationDto,
        CancellationToken cancellationToken = default)
    {
        var organization = _mapper.Map<Organization>(createOrganizationDto);

        await _unitOfWork.GetRepository<IOrganizationRepository>().AddAsync(organization, cancellationToken);
        await _unitOfWork.SaveChangesAsync(cancellationToken);

        return _mapper.Map<OrganizationDto>(organization);
    }

    public async Task UpdateOrganizationAsync(Guid id, UpdateOrganizationDto updateOrganizationDto,
        CancellationToken cancellationToken = default)
    {
        var organization = await GetOrganizationInternalAsync(id, cancellationToken);

        organization.Name = updateOrganizationDto.Name;
        organization.Information = updateOrganizationDto.Information;
        organization.MainGoal = updateOrganizationDto.MainGoal;
        organization.MainDirection = updateOrganizationDto.MainDirection;

        _unitOfWork.GetRepository<IOrganizationRepository>().Update(organization);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteOrganizationAsync(Guid id, CancellationToken cancellationToken = default)
    {
        var organization = await GetOrganizationInternalAsync(id, cancellationToken);

        _unitOfWork.GetRepository<IOrganizationRepository>().Delete(organization);
        await _unitOfWork.SaveChangesAsync(cancellationToken);
    }
    
    #region Private methods

    private async Task<Organization> GetOrganizationInternalAsync(Guid id, CancellationToken cancellationToken)
    {
        var organization = await _unitOfWork
            .GetRepository<IOrganizationRepository>()
            .GetByIdAsync(id, cancellationToken);
        if (organization is null)
        {
            throw new OrganizationNotFoundException();
        }

        return organization;
    }
    
    #endregion
}