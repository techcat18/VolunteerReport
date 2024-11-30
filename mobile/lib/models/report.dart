import 'package:mobile/models/report_detail.dart';

class Report {
  int id;
  String description;
  String destination;
  String? photo;
  List<ReportDetail> reportDetails;
  int userId;

  Report({
    this.photo,
    required this.id,
    required this.description,
    required this.destination,
    required this.reportDetails,
    required this.userId,
  });
}
