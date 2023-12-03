using Microsoft.EntityFrameworkCore;
using VolunteerReport.Application.Abstractions.Persistence;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.Repositories;

public class GenericRepository<T>: IGenericRepository<T> where T : class, IBaseEntity
{
    private readonly AppDbContext _context;
    protected readonly DbSet<T> DbSet;

    protected GenericRepository(AppDbContext context)
    {
        _context = context;
        DbSet = context.Set<T>();
    }

    public IQueryable<T> AsQueryable()
    {
        return DbSet.AsQueryable();
    }

    public virtual async Task<List<T>> GetAllAsync(CancellationToken cancellationToken = default)
    {
        return await DbSet.Where(x => !x.IsDeleted).ToListAsync(cancellationToken);
    }

    public Task<IQueryable<T>> GetAllAsQueryableAsync(CancellationToken cancellationToken = default)
    {
        return Task.FromResult(DbSet.AsQueryable());
    }
    
    public virtual async Task<T?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
    {
        return await DbSet.FirstOrDefaultAsync(x => x.Id == id && !x.IsDeleted, cancellationToken);
    }

    public virtual async Task AddAsync(T entity, CancellationToken cancellationToken = default)
    {
        await _context.AddAsync(entity, cancellationToken);
    }

    public virtual void Update(T entity)
    {
        _context.Update(entity);
    }

    public virtual void Delete(T entity)
    {
        _context.Remove(entity);
    }
}