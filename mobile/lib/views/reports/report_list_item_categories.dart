import 'package:flutter/material.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/widgets/category_chip.dart';

class ReportListItemCategories extends StatelessWidget {
  const ReportListItemCategories._internal(this._categories);

  factory ReportListItemCategories.fromReport(Report report) {
    var categories = report.reportDetails
        .map(
          (reportDetail) => reportDetail.reportCategory.name,
        )
        .toSet()
        .toList();

    return ReportListItemCategories._internal(categories);
  }

  final List<String> _categories;

  List<Widget> _renderCategories(BuildContext context) {
    return _categories
        .map(
          (category) => CategoryChip(
            categoryName: category,
          ),
        )
        .toList();
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
