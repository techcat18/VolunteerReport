import 'package:flutter/material.dart';
import 'package:mobile/helpers/currency_formatter.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/models/report_detail.dart';
import 'package:mobile/themes/app_color_scheme.dart';
import 'package:mobile/themes/app_text_theme.dart';
import 'package:mobile/widgets/category_chip.dart';

class ViewReportCategories extends StatelessWidget {
  const ViewReportCategories({
    super.key,
    required this.report,
  });

  final Report report;

  Widget _renderDetailsText(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: appTextTheme.bodyLarge,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          value,
          style: appTextTheme.bodyLarge!.copyWith(
            color: appColorScheme.secondary,
          ),
        ),
      ],
    );
  }

  Widget _renderCategory(ReportDetail reportDetail) {
    final totalPrice = reportDetail.amount * reportDetail.cost;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        CategoryChip(
          categoryName: reportDetail.reportCategory.name,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 30,
          ),
          child: Column(
            children: [
              _renderDetailsText(
                "Total price:",
                currencyFormatter.format(totalPrice),
              ),
              const SizedBox(
                height: 10,
              ),
              _renderDetailsText(
                "Amount:",
                reportDetail.amount.toString(),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: report.reportDetails.length,
      itemBuilder: (context, index) =>
          _renderCategory(report.reportDetails[index]),
    );
  }
}
