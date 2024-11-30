import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/views/edit_report/edit_report_page.dart';
import 'package:mobile/views/view_report/view_report_categories.dart';
import 'package:mobile/widgets/error_snack_bar.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:mobile/widgets/total_value.dart';

class ViewReportPage extends StatelessWidget {
  const ViewReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final subtitleTheme = textTheme.bodyLarge!.copyWithWeight(
      FontWeight.w600,
    );

    return BlocConsumer<ReportBloc, ReportsState>(
      listener: (context, state) {
        if (state is SingleReportFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            ErrorSnackBar(
              error: state.error,
            ),
          );
          Navigator.pop(context);
        }
        if (state is! ReportsFetching && state is! ReportsSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is ReportsFetching ||
            (state as ReportsSuccess).selectedReport == null) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<ReportBloc>().add(
                        ReportUnselected(),
                      );
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              centerTitle: true,
              title: Text(
                "Report",
                style: textTheme.headlineLarge,
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final report = state.selectedReport!;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<ReportBloc>().add(
                      ReportUnselected(),
                    );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            title: Text(
              "Report",
              style: textTheme.headlineLarge,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditReportPage(
                        isEdit: true,
                      ),
                    ),
                  );
                },
                child: Text(
                  "Edit",
                  style: textTheme.labelLarge,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageContainer(
                  image: report.photo != null
                      ? Image.file(File(report.photo!))
                      : Image.asset("assets/img/placeholder.png"),
                  decoration: ImageContainerDecoration(
                    height: 220,
                    marginBottom: 15,
                    borderRadius: 15,
                  ),
                ),
                Text(
                  "Categories:",
                  style: subtitleTheme,
                ),
                ViewReportCategories(
                  report: report,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Description:",
                  style: subtitleTheme,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Text(
                    report.description,
                    style: textTheme.bodyLarge,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    "Destination: ${report.destination}",
                    style: subtitleTheme,
                  ),
                ),
                TotalValue.fromReport(report.reportDetails),
              ],
            ),
          ),
        );
      },
    );
  }
}
