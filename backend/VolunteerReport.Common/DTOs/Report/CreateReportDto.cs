using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VolunteerReport.Common.DTOs.Report
{
    public class CreateReportDto
    {
        public string Description { get; set; }
        public string Direction { get; set; }
        public DateTime? CreatedAt = DateTime.Now;

        public Guid VolunteerId { get; set; }
    }
}
