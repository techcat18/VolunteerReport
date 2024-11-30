import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile/data/report_category_repository.dart';
import 'package:mobile/models/report_category.dart';
import 'package:mobile/widgets/inputs/reactive_dropdown.dart';
import 'package:mobile/widgets/inputs/reactive_plain_text.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CategoriesFormArray extends StatelessWidget {
  const CategoriesFormArray({super.key});

  Widget _buildCategoryItem(
    int index,
    Future<List<ReportCategory>> Function() getCategories,
  ) {
    return Column(
      children: [
        ReactiveDropdown(
          name: "$index.category",
          label: "Categories",
          getItems: () async {
            final categories = await getCategories();
            return categories.map((o) => o.name).toList();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Column(
            children: [
              ReactivePlainText(
                label: "Total price",
                name: "$index.total",
              ),
              const SizedBox(
                height: 10,
              ),
              ReactivePlainText(
                label: "Amount",
                name: "$index.amount",
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ReportCategoryRepository>();
    final getCategories = repository.getAll;

    return ReactiveFormArray(
      formArrayName: "categories",
      builder: (context, formArray, child) {
        final controls = formArray.controls;

        return Column(
          children: List.generate(
            controls.length,
            (i) => _buildCategoryItem(i, getCategories),
          ),
        );
      },
    );
  }
}
