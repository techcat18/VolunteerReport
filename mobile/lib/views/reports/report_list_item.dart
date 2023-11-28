import 'package:flutter/material.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/views/reports/report_list_item_categories.dart';
import 'package:mobile/views/reports/report_list_item_total.dart';

class ReportsListItem extends StatelessWidget {
  const ReportsListItem({
    super.key,
    required this.report,
  });

  final Report report;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: theme.colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              margin: const EdgeInsets.only(
                bottom: 12,
              ),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/placeholder.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Description:",
              style: textTheme.bodyLarge!.copyWithWeight(
                FontWeight.w500,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 20,
              ),
              child: Text(
                maxLines: 3,
                report.description,
                style: textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ReportListItemCategories.fromReport(report),
            ReportListItemTotal.fromReport(report),
          ],
        ),
      ),
    );
  }
}
