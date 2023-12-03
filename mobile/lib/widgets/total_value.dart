import 'package:flutter/material.dart';
import 'package:mobile/helpers/currency_formatter.dart';
import 'package:mobile/helpers/text_style_extensions.dart';
import 'package:mobile/models/report_detail.dart';

class TotalValue extends StatelessWidget {
  const TotalValue._internal(this._totalAmount);

  factory TotalValue.fromReport(List<ReportDetail> reportDetails) {
    var total = reportDetails.map(
      (reportDetail) {
        return reportDetail.amount * reportDetail.cost;
      },
    ).reduce(
      (accumulator, categoryCost) {
        return accumulator += categoryCost;
      },
    );

    return TotalValue._internal(total);
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
            currencyFormatter.format(_totalAmount),
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
