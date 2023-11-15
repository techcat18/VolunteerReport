using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VolunteerReport.Persistence.Migrations
{
    public partial class changedVolunteerProperties : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<Guid>(
                name: "UserId",
                table: "Volunteers",
                type: "uniqueidentifier",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddColumn<Guid>(
                name: "VolunteerId",
                table: "AspNetUsers",
                type: "uniqueidentifier",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "UserId",
                table: "Volunteers");

            migrationBuilder.DropColumn(
                name: "VolunteerId",
                table: "AspNetUsers");
        }
    }
}
