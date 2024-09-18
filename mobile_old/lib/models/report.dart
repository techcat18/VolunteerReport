import 'package:mobile/models/report_detail.dart';

class Report {
  Report({
    required this.id,
    required this.description,
    required this.reportDetails,
  });

  String id;
  String description;
  List<ReportDetail> reportDetails;
}
