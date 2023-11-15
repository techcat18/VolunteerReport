using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Application.Abstractions.Persistence;

public interface IGenericRepository<T>: IRepository where T: BaseEntity
{
    IQueryable<T> AsQueryable();
    Task<List<T>> GetAllAsync(CancellationToken cancellationToken);
    Task<T?> GetByIdAsync(Guid id, CancellationToken cancellationToken);
    Task AddAsync(T entity, CancellationToken cancellationToken);
    void Update(T entity);
    void Delete(T entity);
    Task SaveChangesAsync(CancellationToken cancellationToken);
}