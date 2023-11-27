import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    var textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total value",
          style: textTheme.titleLarge,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 5,
            left: 5,
          ),
          child: Text(
            _formatCurrency.format(_totalAmount),
            style: textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
