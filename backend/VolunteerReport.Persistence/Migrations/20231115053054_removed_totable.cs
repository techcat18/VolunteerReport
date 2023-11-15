using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VolunteerReport.Persistence.Migrations
{
    public partial class removed_totable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ReportDetails_reportCategories_CategoryId",
                table: "ReportDetails");

            migrationBuilder.DropPrimaryKey(
                name: "PK_reportCategories",
                table: "reportCategories");

            migrationBuilder.RenameTable(
                name: "reportCategories",
                newName: "ReportCategories");

            migrationBuilder.AddPrimaryKey(
                name: "PK_ReportCategories",
                table: "ReportCategories",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ReportDetails_ReportCategories_CategoryId",
                table: "ReportDetails",
                column: "CategoryId",
                principalTable: "ReportCategories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ReportDetails_ReportCategories_CategoryId",
                table: "ReportDetails");

            migrationBuilder.DropPrimaryKey(
                name: "PK_ReportCategories",
                table: "ReportCategories");

            migrationBuilder.RenameTable(
                name: "ReportCategories",
                newName: "reportCategories");

            migrationBuilder.AddPrimaryKey(
                name: "PK_reportCategories",
                table: "reportCategories",
                column: "Id");

            migrationBuilder.AddForeignKey(
                name: "FK_ReportDetails_reportCategories_CategoryId",
                table: "ReportDetails",
                column: "CategoryId",
                principalTable: "reportCategories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
