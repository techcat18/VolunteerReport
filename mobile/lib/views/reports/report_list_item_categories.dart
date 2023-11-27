import 'package:flutter/material.dart';
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
        return Chip(
          label: Text(category),
          backgroundColor: theme.colorScheme.primaryContainer,
          labelStyle: theme.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(0),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 6,
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
