import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/models/report.dart';

final _formatCurrency = NumberFormat.currency(
  locale: "uk_UA",
  symbol: "\u{20B4}",
);

class ReportListItemTotal extends StatelessWidget {
  const ReportListItemTotal._internal(this._totalAmount);

  factory ReportListItemTotal.fromReport(Report report) {
    var total = report.reportDetails.map(
      (reportDetail) {
        return reportDetail.amount * reportDetail.cost;
      },
    ).reduce(
      (accumulator, categoryCost) {
        return accumulator += categoryCost;
      },
    );

    return ReportListItemTotal._internal(total);
  }

  final double _totalAmount;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total value",
          style: textTheme.bodyLarge!.copyWithWeight(
            FontWeight.w600,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 6,
          ),
          child: Text(
            _formatCurrency.format(_totalAmount),
            style: textTheme.bodyLarge!.copyWithWeight(
              FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
          ),
        )
      ],
    );
  }
}
