import 'package:flutter/material.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/models/report.dart';

class ReportListItemCategories extends StatelessWidget {
  const ReportListItemCategories._internal(this._categories);

  factory ReportListItemCategories.fromReport(Report report) {
    var total = report.reportDetails
        .map(
          (reportDetail) {
            return reportDetail.reportCategory.name;
          },
        )
        .toSet()
        .toList();

    return ReportListItemCategories._internal(total);
  }

  final List<String> _categories;

  List<Widget> _renderCategories(BuildContext context) {
    var theme = Theme.of(context);

    return _categories.map(
      (category) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 9,
            ),
            child: Text(
              category,
              style: theme.textTheme.bodyLarge!.copyWithWeight(
                FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        direction: Axis.horizontal,
        children: _renderCategories(context),
      ),
    );
  }
}
