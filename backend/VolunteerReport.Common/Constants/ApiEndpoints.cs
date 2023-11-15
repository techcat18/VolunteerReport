namespace VolunteerReport.Common.Constants;

public partial class Constants
{
    public class ApiEndpoints
    {
        private const string IdPlaceholder = "{id}";
        
        public static class ReportCategories
        {
            public const string Base = "/api/v1/reportCategories";
            public const string GetAll = Base;
            public const string GetById = $"{Base}/{IdPlaceholder}";
            public const string Create = Base;
            public const string Update = $"{Base}/{IdPlaceholder}";
            public const string Delete = $"{Base}/{IdPlaceholder}";
        }
    }
}
