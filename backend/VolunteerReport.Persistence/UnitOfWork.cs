using Microsoft.Extensions.DependencyInjection;
using VolunteerReport.Application.Abstractions.Persistence;

namespace VolunteerReport.Persistence;

class UnitOfWork : IUnitOfWork
{
    private readonly AppDbContext _dbContext;
    private readonly IServiceProvider _serviceProvider;
    private readonly Dictionary<string, object> _repositories;

    public UnitOfWork(
        AppDbContext dbContext,
        IServiceProvider serviceProvider)
    {
        _dbContext = dbContext;
        _serviceProvider = serviceProvider;
        _repositories = new Dictionary<string, object>();
    }

    public int SaveChanges()
    {
        return _dbContext.SaveChanges();
    }

    public Task<int> SaveChangesAsync(CancellationToken cancellationToken = default)
    {
        return _dbContext.SaveChangesAsync(cancellationToken);
    }

    T IUnitOfWork.GetRepository<T>()
    {
        var typeName = typeof(T).Name;

        if (!_repositories.ContainsKey(typeName))
        {
            var instance = _serviceProvider.GetService<T>();
            if (instance is not null)
            {
                _repositories.Add(typeName, instance);
            }
        }

        return (T)_repositories[typeName];
    }

    public void Dispose()
    {
        _dbContext.Dispose();
        _repositories.Clear();
    }
}