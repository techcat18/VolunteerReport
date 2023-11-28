import 'package:flutter/material.dart';
import 'package:mobile/views/profile/profile_page.dart';
import 'package:mobile/views/reports/add_report_button.dart';
import 'package:mobile/views/reports/reports_list.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  void _openProfileView(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _openProfileView(context),
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 32),
              child: Text(
                "Reports",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: 17,
            ),
            sliver: ReportsList(),
          ),
        ],
      ),
    );
  }
}
