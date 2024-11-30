import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/views/reports/report_list_item_categories.dart';
import 'package:mobile/views/view_report/view_report.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:mobile/widgets/total_value.dart';

class ReportsListItem extends StatelessWidget {
  const ReportsListItem({
    super.key,
    required this.report,
  });

  final Report report;

  void onSelectReport(BuildContext context) {
    context.read<ReportBloc>().add(ReportSelected(report.id));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ViewReportPage(),
      ),
    );
  }

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
      child: InkWell(
        onTap: () => onSelectReport(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageContainer(
                decoration: ImageContainerDecoration(
                  height: 180,
                  marginBottom: 12,
                  borderRadius: 15,
                ),
                image: report.photo != null
                    ? Image.file(File(report.photo!))
                    : Image.asset("assets/img/placeholder.png"),
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
              TotalValue.fromReport(report.reportDetails),
            ],
          ),
        ),
      ),
    );
  }
}
