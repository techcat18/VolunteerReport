import 'package:flutter/material.dart';
import 'package:mobile/views/reports/dummy_data.dart';
import 'package:mobile/views/reports/report_list_item.dart';

class ReportsList extends StatelessWidget {
  const ReportsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        final report = dummyData[index];

        return ReportsListItem(report: report);
      },
    );
  }
}
