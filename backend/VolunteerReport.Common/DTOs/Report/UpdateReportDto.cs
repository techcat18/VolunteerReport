using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VolunteerReport.Common.DTOs.Report
{
    public class UpdateReportDto
    {
        public string Description { get; set; }
        public string Direction { get; set; }
        public DateTime? ModifiedAt = DateTime.Now;

        public Guid VolunteerId { get; set; }
    }
}
