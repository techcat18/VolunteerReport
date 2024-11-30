import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/views/reports/reports_page.dart';

class DeleteReportButton extends StatelessWidget {
  const DeleteReportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return TextButton(
      onPressed: () => showDeleteConfirmationDialog(context),
      child: Text(
        "Delete",
        style: textTheme.labelLarge!.copyWith(
          color: theme.colorScheme.error,
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    var state = context.read<ReportBloc>().state;

    if (state is! ReportsSuccess || state.selectedReport == null) {
      return;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 37,
                  horizontal: 38,
                ),
                child: Center(
                  child: Text(
                    'Do you really want to delete this report?',
                    textAlign: TextAlign.center,
                    style: textTheme.labelLarge!.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: theme.colorScheme.primary,
                            width: 1,
                          ),
                          right: BorderSide(
                            color: theme.colorScheme.primary,
                            width: 1,
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReportsPage(),
                            ),
                            (route) => false,
                          );
                          context.read<ReportBloc>().add(
                                ReportDeleteRequested(
                                  state.selectedReport!.id,
                                ),
                              );
                        },
                        child: Text(
                          'Yes',
                          style: textTheme.labelLarge!.copyWith(
                            fontSize: 24,
                            color: const Color(0xffe71010),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: theme.colorScheme.primary,
                            width: 1,
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'No',
                          style: textTheme.labelLarge!.copyWith(
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
