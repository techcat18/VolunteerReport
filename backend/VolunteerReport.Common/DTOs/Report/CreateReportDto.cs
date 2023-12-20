﻿using VolunteerReport.Common.DTOs.ReportDetail;

namespace VolunteerReport.Common.DTOs.Report
{
    public class CreateReportDto
    {
        public string Description { get; set; }
        public string Direction { get; set; }
        public DateTime? CreatedAt = DateTime.Now;
        public Guid VolunteerId { get; set; }
        public ICollection<CreateReportDetailDto> Details { get; set; }
    }
}
