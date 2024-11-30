import 'package:flutter/material.dart';
import 'package:mobile/views/edit_report/delete_report_button.dart';
import 'package:mobile/views/edit_report/edit_report_form.dart';

class EditReportPage extends StatelessWidget {
  final bool isEdit;

  const EditReportPage({super.key, this.isEdit = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          isEdit ? "Edit Report" : "Add Report",
          style: textTheme.headlineLarge,
        ),
        actions: isEdit ? [const DeleteReportButton()] : null,
      ),
      body: const SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 40, 30, 20),
                child: EditReportForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
