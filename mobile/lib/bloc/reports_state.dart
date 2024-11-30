part of 'reports_bloc.dart';

@immutable
sealed class ReportsState {}

final class ReportsInitial extends ReportsState {}

final class ReportsFetching extends ReportsState {}

final class ReportsSuccess extends ReportsState {
  final List<Report> reports;
  final Report? selectedReport;

  ReportsSuccess({
    required this.reports,
    this.selectedReport,
  });
}

final class ReportsFailure extends ReportsState {
  final String error;

  ReportsFailure(this.error);
}

final class SingleReportFailure extends ReportsSuccess {
  final String error;

  SingleReportFailure(
    this.error, {
    required super.reports,
    super.selectedReport,
  });
}
