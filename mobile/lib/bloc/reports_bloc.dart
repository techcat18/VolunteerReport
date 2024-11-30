import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/data/report_repository.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/models/report_category.dart';
import 'package:mobile/models/report_detail.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportsState> {
  final ReportRepository _reportRepository;

  ReportBloc(
    this._reportRepository,
  ) : super(ReportsInitial()) {
    on<ReportsListRequested>(_onReportsListRequested);
    on<ReportSelected>(_onReportSelected);
    on<ReportUnselected>(_onReportUnselected);
    on<ReportUpdateRequested>(_onReportUpdateRequested);
    on<ReportDeleteRequested>(_onReportDeleteRequested);
  }

  void _onReportUnselected(
    ReportUnselected event,
    Emitter<ReportsState> emit,
  ) {
    final currentState = state as ReportsSuccess;
    return emit(ReportsSuccess(reports: currentState.reports));
  }

  FutureOr<void> _onReportDeleteRequested(
    ReportDeleteRequested event,
    Emitter<ReportsState> emit,
  ) async {
    final currentState = state as ReportsSuccess;
    emit(ReportsFetching());
    try {
      await _reportRepository.delete(event.id);
      return emit(
        ReportsSuccess(
          reports: currentState.reports.where((r) => r.id != event.id).toList(),
        ),
      );
    } catch (e) {
      return emit(SingleReportFailure(
        e.toString(),
        reports: currentState.reports,
        selectedReport: currentState.selectedReport,
      ));
    }
  }

  FutureOr<void> _onReportUpdateRequested(
    ReportUpdateRequested event,
    Emitter<ReportsState> emit,
  ) async {
    var currentState = state as ReportsSuccess;
    emit(ReportsFetching());
    try {
      if (currentState.selectedReport != null) {
        return await _updateReport(currentState, event, emit);
      } else {
        return await _insertReport(currentState, event, emit);
      }
    } catch (e) {
      return emit(SingleReportFailure(
        e.toString(),
        reports: currentState.reports,
        selectedReport: currentState.selectedReport,
      ));
    }
  }

  _updateReport(
    ReportsSuccess successState,
    ReportUpdateRequested event,
    Emitter<ReportsState> emit,
  ) async {
    final currentReport = successState.selectedReport!;

    currentReport.photo = event.photoPath;
    currentReport.description = event.description;
    currentReport.destination = event.destination;
    currentReport.reportDetails = _getReportDetails(event.categories);

    await _reportRepository.update(currentReport);
    return emit(ReportsSuccess(
      reports: successState.reports,
      selectedReport: successState.selectedReport,
    ));
  }

  _insertReport(
    ReportsSuccess successState,
    ReportUpdateRequested event,
    Emitter<ReportsState> emit,
  ) async {
    final newReport = Report(
      id: Random().nextInt(1000) + 50,
      userId: event.userId,
      description: event.description,
      destination: event.destination,
      photo: event.photoPath,
      reportDetails: _getReportDetails(event.categories),
    );

    await _reportRepository.create(newReport);
    return emit(ReportsSuccess(
      reports: [...successState.reports, newReport],
      selectedReport: newReport,
    ));
  }

  List<ReportDetail> _getReportDetails(
    List<ReportCategoryUpdate> categories,
  ) =>
      categories
          .map(
            (e) => ReportDetail(
              id: Random().nextInt(10000) + 1000,
              cost: double.parse(e.total),
              amount: int.parse(e.amount),
              reportCategory: ReportCategory(
                  id: Random().nextInt(10000) + 50, name: e.category),
            ),
          )
          .toList();

  FutureOr<void> _onReportSelected(
    ReportSelected event,
    Emitter<ReportsState> emit,
  ) async {
    final currentState = state as ReportsSuccess;
    emit(ReportsFetching());
    try {
      final report = await _reportRepository.getOne(event.id);
      if (report == null) {
        return emit(
          SingleReportFailure(
            "Requested report not found!",
            reports: currentState.reports,
            selectedReport: currentState.selectedReport,
          ),
        );
      }
      return emit(
        ReportsSuccess(
          reports: currentState.reports,
          selectedReport: report,
        ),
      );
    } catch (e) {
      return emit(SingleReportFailure(
        e.toString(),
        reports: currentState.reports,
        selectedReport: currentState.selectedReport,
      ));
    }
  }

  FutureOr<void> _onReportsListRequested(
    ReportsListRequested event,
    Emitter<ReportsState> emit,
  ) async {
    emit(ReportsFetching());
    try {
      final reports = await _reportRepository.getAll();
      return emit(ReportsSuccess(
          reports: reports
              .where(
                (r) => r.userId == event.userId,
              )
              .toList()));
    } catch (e) {
      return emit(ReportsFailure(e.toString()));
    }
  }
}
