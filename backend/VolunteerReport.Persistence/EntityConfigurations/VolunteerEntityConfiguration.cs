using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using VolunteerReport.Domain.Entities;

namespace VolunteerReport.Persistence.EntityConfigurations;

public class VolunteerEntityConfiguration: IEntityTypeConfiguration<Volunteer>
{
    public void Configure(EntityTypeBuilder<Volunteer> builder)
    {
        builder.HasKey(x => x.Id);

        builder
            .HasOne(x => x.User)
            .WithOne(x => x.Volunteer)
            .HasForeignKey<Volunteer>(x => x.Id);
    }
}