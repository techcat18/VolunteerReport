import 'package:mobile/models/report_category.dart';

final reportCategoriesList = [
  ReportCategory(
    id: 1,
    name: "Drones",
  ),
  ReportCategory(
    id: 2,
    name: "Medicine",
  ),
  ReportCategory(
    id: 3,
    name: "Food",
  ),
  ReportCategory(
    id: 4,
    name: "Ammunition",
  ),
];

class ReportCategoryRepository {
  ReportCategoryRepository();

  Future<List<ReportCategory>> getAll() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => reportCategoriesList,
    );
  }
}
