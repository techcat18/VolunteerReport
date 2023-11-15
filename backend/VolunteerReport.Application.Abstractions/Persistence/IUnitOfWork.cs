namespace VolunteerReport.Application.Abstractions.Persistence;

public interface IUnitOfWork: IDisposable
{
    int SaveChanges();
    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
    T GetRepository<T>() where T : class, IRepository;
}