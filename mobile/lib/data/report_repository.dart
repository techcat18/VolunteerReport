import 'package:mobile/models/report.dart';
import 'package:mobile/models/report_category.dart';
import 'package:mobile/models/report_detail.dart';

final reportsList = [
  Report(
    id: 1,
    userId: 1,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntutlabore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatatnonproiden,sunt in culpa qui officia deserunt mollit anim id estlaborum",
    destination: "Kharkiv",
    reportDetails: [
      ReportDetail(
        id: 1,
        amount: 500,
        cost: 1000,
        reportCategory: ReportCategory(
          id: 1,
          name: "medicine",
        ),
      ),
      ReportDetail(
        id: 2,
        amount: 50,
        cost: 15200,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
      ReportDetail(
        id: 3,
        amount: 2,
        cost: 56000,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
    ],
  ),
  Report(
    id: 3,
    userId: 1,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntutlabore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatatnonproiden,sunt in culpa qui officia deserunt mollit anim id estlaborum",
    destination: "Kharkiv",
    reportDetails: [
      ReportDetail(
        id: 4,
        amount: 500,
        cost: 1000,
        reportCategory: ReportCategory(
          id: 1,
          name: "medicine",
        ),
      ),
      ReportDetail(
        id: 5,
        amount: 50,
        cost: 15200,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
      ReportDetail(
        id: 6,
        amount: 2,
        cost: 56000,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
    ],
  ),
  Report(
    id: 2,
    userId: 1,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntutlabore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatatnonproiden,sunt in culpa qui officia deserunt mollit anim id estlaborum",
    destination: "Kharkiv",
    reportDetails: [
      ReportDetail(
        id: 7,
        amount: 500,
        cost: 1000,
        reportCategory: ReportCategory(
          id: 1,
          name: "medicine",
        ),
      ),
      ReportDetail(
        id: 8,
        amount: 50,
        cost: 15200,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
      ReportDetail(
        id: 9,
        amount: 2,
        cost: 56000,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
    ],
  ),
  Report(
    id: 4,
    userId: 1,
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididuntutlabore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatatnonproiden,sunt in culpa qui officia deserunt mollit anim id estlaborum",
    destination: "Kharkiv",
    reportDetails: [
      ReportDetail(
        id: 10,
        amount: 500,
        cost: 1000,
        reportCategory: ReportCategory(
          id: 1,
          name: "medicine",
        ),
      ),
      ReportDetail(
        id: 11,
        amount: 50,
        cost: 15200,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
      ReportDetail(
        id: 12,
        amount: 2,
        cost: 56000,
        reportCategory: ReportCategory(
          id: 2,
          name: "drones",
        ),
      ),
    ],
  )
];

class ReportRepository {
  ReportRepository();

  Future<List<Report>> getAll() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => reportsList,
    );
  }

  Future<Report?> getOne(int id) {
    return Future.delayed(
      const Duration(seconds: 2),
      () => reportsList.firstWhere(
        (report) => report.id == id,
      ),
    );
  }

  Future<void> create(Report report) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        reportsList.add(report);
      },
    );
  }

  Future<void> delete(int id) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        reportsList.removeWhere(
          (report) => report.id == id,
        );
      },
    );
  }

  Future<void> update(Report report) {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        final index = reportsList.indexWhere(
          (r) => r.id == report.id,
        );
        reportsList[index] = report;
      },
    );
  }
}
