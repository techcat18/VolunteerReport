import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/models/report.dart';
import 'package:mobile/models/user.dart';
import 'package:mobile/views/edit_report/add_category_button.dart';
import 'package:mobile/views/edit_report/categories_form_array.dart';
import 'package:mobile/widgets/image_container.dart';
import 'package:mobile/widgets/inputs/reactive_image_picker.dart';
import 'package:mobile/widgets/inputs/reactive_plain_text.dart';
import 'package:mobile/widgets/submit_button.dart';
import 'package:mobile/widgets/total_value.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditReportForm extends StatefulWidget {
  const EditReportForm({super.key});

  @override
  State<EditReportForm> createState() => _EditReportFormState();
}

class _EditReportFormState extends State<EditReportForm> {
  late User user;
  Report? report;

  @override
  void initState() {
    super.initState();
    user = (context.read<UserBloc>().state as AuthSuccess).user;

    final reportsState = context.read<ReportBloc>().state;
    if (reportsState is ReportsSuccess) {
      report = reportsState.selectedReport;
    }
  }

  FormGroup _createFormItem({
    String category = "",
    double total = 0,
    int amount = 0,
  }) {
    return fb.group({
      "category": [category, Validators.required],
      "total": [
        total,
        Validators.required,
        Validators.pattern("^[0-9]{1,3}(?:,?[0-9]{3})*\.?[0-9]{0,2}\$"),
      ],
      "amount": [
        amount,
        Validators.required,
        Validators.number(),
      ],
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    final form = fb.group({
      "photo": [
        report?.photo != null ? File(report!.photo!) : null,
        Validators.required,
      ],
      "description": [
        report?.description,
        Validators.required,
      ],
      "destination": [
        report?.destination,
        Validators.required,
      ],
      "categories":
          fb.array((report != null && report!.reportDetails.isNotEmpty)
              ? report!.reportDetails
                  .map(
                    (details) => _createFormItem(
                      category: details.reportCategory.name,
                      total: details.cost,
                      amount: details.amount,
                    ),
                  )
                  .toList()
              : [_createFormItem()]),
    });

    return ReactiveForm(
      formGroup: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReactiveImagePicker(
            name: "photo",
            icon: report?.photo != null
                ? SvgPicture.asset(
                    "assets/icons/edit.svg",
                    width: 65,
                    height: 58,
                    colorFilter: ColorFilter.mode(
                      theme.colorScheme.primary,
                      BlendMode.srcIn,
                    ),
                  )
                : SvgPicture.asset("assets/icons/add_photo_icon.svg"),
            decoration: ImageContainerDecoration(
              height: 220,
              opacity: 0.5,
              marginBottom: 15,
              borderRadius: 15,
              borderColor: theme.colorScheme.primary,
            ),
          ),
          const ReactivePlainText(
            name: "description",
            label: "Description",
          ),
          const SizedBox(
            height: 10,
          ),
          const ReactivePlainText(
            name: "destination",
            label: "Destination",
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "Categories:",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const CategoriesFormArray(),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AddCategoryButton(
                  onAddCategory: () =>
                      (form.controls["categories"] as FormArray).add(
                    _createFormItem(),
                  ),
                ),
              ],
            ),
          ),
          ReactiveFormConsumer(
            builder: (context, formGroup, child) {
              return TotalValue.fromReportForm(
                formGroup.controls["categories"] as FormArray,
              );
            },
          ),
          const Spacer(),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            child: SubmitButton(
              onSubmit: () {
                _saveChanges(form, context);
              },
              text: "Save",
            ),
          ),
        ],
      ),
    );
  }

  void _saveChanges(FormGroup form, BuildContext context) {
    if (form.valid) {
      final photo = (form.value['photo'] as File).path;
      final description = form.value['description'] as String;
      final destination = form.value['destination'] as String;
      final categories = (form.value['categories'] as List<dynamic>);

      context.read<ReportBloc>().add(
            ReportUpdateRequested(
              userId: user.id,
              photoPath: photo,
              description: description,
              destination: destination,
              categories: categories
                  .map(
                    (categoriesMap) => ReportCategoryUpdate(
                      category: categoriesMap["category"] as String,
                      total: categoriesMap["total"].toString(),
                      amount: categoriesMap["amount"].toString(),
                    ),
                  )
                  .toList(),
            ),
          );
      Navigator.pop(context);
    } else {
      form.markAllAsTouched();
    }
  }
}
