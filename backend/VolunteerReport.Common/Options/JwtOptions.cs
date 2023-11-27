﻿namespace VolunteerReport.Common.Options;

public class JwtOptions
{
    public const string SectionName = "JwtSettings";
    
    public string Issuer { get; set; }
    public string Audience { get; set; }
    public string Secret { get; set; }
}