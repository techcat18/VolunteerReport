import 'package:flutter/material.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/views/reports/dummy_data.dart';
import 'package:mobile/views/view_report/view_report_categories.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:mobile/widgets/total_value.dart';

class ViewReportPage extends StatelessWidget {
  const ViewReportPage({
    super.key,
    required this.reportId,
  });

  final String reportId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final subtitleTheme = textTheme.bodyLarge!.copyWithWeight(
      FontWeight.w600,
    );

    final report = dummyData.firstWhere(
      (element) => element.id == reportId,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
            onPressed: () {},
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
              image: Image.asset("assets/placeholder.png"),
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
                "Destination:",
                style: subtitleTheme,
              ),
            ),
            TotalValue.fromReport(report.reportDetails),
          ],
        ),
      ),
    );
  }
}
