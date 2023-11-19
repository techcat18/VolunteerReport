import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/views/reports/add_report_button.dart';
import 'package:mobile/views/reports/reports_list.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          iconSize: 40,
          splashRadius: 12,
          icon: const Icon(Icons.account_circle),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 40,
            splashRadius: 12,
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
      ),
      floatingActionButton: const AddReportButton(),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Reports",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              const Expanded(
                child: ReportsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
