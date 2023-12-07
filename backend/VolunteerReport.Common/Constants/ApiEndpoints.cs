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

        public static class Volunteers
        {
            public const string Base = "/api/v1/volunteers";
            public const string GetAll = Base;
            public const string GetById = $"{Base}/{IdPlaceholder}";
            public const string Create = Base;
            public const string Update = $"{Base}/{IdPlaceholder}";
            public const string Delete = $"{Base}/{IdPlaceholder}";
        }
        
        public static class Organizations
        {
            public const string Base = "/api/v1/organizations";
            public const string GetAll = Base;
            public const string GetById = $"{Base}/{IdPlaceholder}";
            public const string Create = Base;
            public const string Update = $"{Base}/{IdPlaceholder}";
            public const string Delete = $"{Base}/{IdPlaceholder}";
        }

        public static class Roles
        {
            public const string Base = "/api/v1/roles";
            public const string GetAll = Base;
            public const string GetById = $"{Base}/{IdPlaceholder}";
            public const string Create = Base;
            public const string Update = $"{Base}/{IdPlaceholder}";
            public const string Delete = $"{Base}/{IdPlaceholder}";
            public const string AddPermissions = $"{Base}/{IdPlaceholder}/permissions";
            public const string RemovePermissions = $"{Base}/{IdPlaceholder}/permissions";
        }

        public static class Auth
        {
            public const string Base = "/api/v1/auth";
            public const string Login = $"{Base}/login";
            public const string Signup = $"{Base}/signup";
        }

        public static class Users
        {
            public const string Base = "/api/v1/users";
            public const string GetAll = Base;
            public const string GetById = $"{Base}/{IdPlaceholder}";
        }

        public static class CurrentUser
        {
            public const string Base = "/api/v1";
            public const string Info = $"{Base}/me";
        }
    }
}
