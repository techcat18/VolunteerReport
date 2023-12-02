using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Persistence;

public interface IGenericRepository<T>: IRepository where T: IBaseEntity
{
    IQueryable<T> AsQueryable();
    Task<List<T>> GetAllAsync(CancellationToken cancellationToken = default);
    Task<T?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
    Task AddAsync(T entity, CancellationToken cancellationToken = default);
    void Update(T entity);
    void Delete(T entity);
}