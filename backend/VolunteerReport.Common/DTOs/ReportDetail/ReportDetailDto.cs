﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VolunteerReport.Common.DTOs.Report;
using VolunteerReport.Common.DTOs.ReportCategory;

namespace VolunteerReport.Common.DTOs.ReportDetail
{
    public class ReportDetailDto
    {
        public Guid Id { get; set; }
        public double Amount { get; set; }
        public decimal Cost { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? ModifiedAt { get; set; }
        public bool IsDeleted { get; set; }

        public Guid ReportId { get; set; }
        public ReportDto Report { get; set; }
        public Guid CategoryId { get; set; }
        public ReportCategoryDto Category { get; set; }
    }
}
