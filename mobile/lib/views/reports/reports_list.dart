import 'package:flutter/material.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/views/reports/report_list_item.dart';

final _dummyData = [
  Report(
    "Name of the report",
    "///////////////////////////////////////////////////////////////////////////////////////////////////",
    "assets/placeholder.png",
  ),
  Report(
    "Name of the report",
    "///////////////////////////////////////////////////////////////////////////////////////////////////",
    "assets/placeholder.png",
  ),
  Report(
    "Name of the report",
    "///////////////////////////////////////////////////////////////////////////////////////////////////",
    "assets/placeholder.png",
  ),
];

class ReportsList extends StatelessWidget {
  const ReportsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: _dummyData.length,
      itemBuilder: (context, index) {
        final report = _dummyData[index];
        return ReportsListItem(report: report);
      },
    );
  }
}
