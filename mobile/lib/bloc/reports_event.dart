part of 'reports_bloc.dart';

@immutable
sealed class ReportEvent {}

final class ReportsListRequested extends ReportEvent {
  final int userId;

  ReportsListRequested({required this.userId});
}

final class ReportSelected extends ReportEvent {
  final int id;

  ReportSelected(this.id);
}

final class ReportUnselected extends ReportEvent {
  ReportUnselected();
}

final class ReportCategoryUpdate {
  final String category;
  final String total;
  final String amount;

  ReportCategoryUpdate({
    required this.category,
    required this.total,
    required this.amount,
  });
}

final class ReportUpdateRequested extends ReportEvent {
  final String photoPath;
  final String description;
  final String destination;
  final int userId;
  final List<ReportCategoryUpdate> categories;

  ReportUpdateRequested({
    required this.photoPath,
    required this.description,
    required this.destination,
    required this.categories,
    required this.userId,
  });
}

final class ReportDeleteRequested extends ReportEvent {
  final int id;

  ReportDeleteRequested(this.id);
}
