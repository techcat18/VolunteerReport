import 'package:mobile/models/report_category.dart';

class ReportDetail {
  ReportDetail({
    required this.id,
    required this.cost,
    required this.amount,
    required this.reportCategory,
  });

  String id;
  double cost;
  double amount;
  ReportCategory reportCategory;
}
