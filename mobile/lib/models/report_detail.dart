import 'package:mobile/models/report_category.dart';

class ReportDetail {
  final int id;
  final int amount;
  final double cost;
  final ReportCategory reportCategory;

  ReportDetail({
    required this.id,
    required this.cost,
    required this.amount,
    required this.reportCategory,
  });
}
