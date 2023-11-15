using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.EntityConfigurations;

public class ReportCategoryEntityConfiguration: IEntityTypeConfiguration<ReportCategory>
{
    public void Configure(EntityTypeBuilder<ReportCategory> builder)
    {
        builder.HasKey(x => x.Id);

        builder
            .Property(x => x.Name)
            .IsRequired();
        
        builder
            .Property(x => x.Description)
            .IsRequired();
    }
}