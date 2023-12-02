namespace VolunteerReport.Common.Utility;

public class PaginatedList<T>
{
    public int PageNumber { get; }
    public int PageSize { get; }
    public int? TotalPages { get; }
    public int? TotalCount { get; }
    public IEnumerable<T> Items { get; set; }

    public PaginatedList(IEnumerable<T> items, int count, int pageNumber, int pageSize)
    {
        Items = items;
        PageNumber = pageNumber;
        PageSize = pageSize;
        TotalPages = (int)Math.Ceiling(count / (double)pageSize);
        TotalCount = count;
    }

    public static PaginatedList<T> CreateFromQueryable(IQueryable<T> source, int pageNumber = 1, int pageSize = 10)
    {
        var count = source.Count();
        var items = source.Skip((pageNumber - 1) * pageSize).Take(pageSize).ToList();
        return new PaginatedList<T>(items, count, pageNumber, pageSize);
    }
}