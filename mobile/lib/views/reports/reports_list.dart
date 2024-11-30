import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/views/reports/report_list_item.dart';

class ReportsList extends StatelessWidget {
  const ReportsList({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<ReportBloc>().state as ReportsSuccess;

    return SliverList.builder(
      itemCount: state.reports.length,
      itemBuilder: (context, index) {
        final report = state.reports[index];

        return ReportsListItem(report: report);
      },
    );
  }
}
