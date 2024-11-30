import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/bloc/reports_bloc.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/views/login/login_page.dart';
import 'package:mobile/views/profile/profile_page.dart';
import 'package:mobile/views/reports/add_report_button.dart';
import 'package:mobile/views/reports/reports_list.dart';
import 'package:mobile/widgets/error_snack_bar.dart';

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
    final state = context.read<UserBloc>().state;
    if (state is AuthSuccess) {
      context
          .read<ReportBloc>()
          .add(ReportsListRequested(userId: state.user.id));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => _openProfileView(context),
          iconSize: 40,
          splashRadius: 12,
          icon: const Icon(Icons.account_circle),
        ),
        actions: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                );
              }

              return IconButton(
                onPressed: () {
                  context.read<UserBloc>().add(AuthLogoutRequested());
                },
                iconSize: 40,
                splashRadius: 12,
                icon: const Icon(Icons.logout),
              );
            },
          )
        ],
      ),
      floatingActionButton: const AddReportButton(),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              ErrorSnackBar(
                error: state.error,
              ),
            );
          }
          if (state is UserInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false,
            );
          }
        },
        child: BlocBuilder<ReportBloc, ReportsState>(
          builder: (context, state) {
            if (state is ReportsFetching) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ReportsFailure) {
              return Center(
                child: Text(
                  state.error,
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            if (state is! ReportsSuccess) {
              return const Center(
                child: Text(
                  "Ooops, something went wrong!",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }

            return CustomScrollView(
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
            );
          },
        ),
      ),
    );
  }
}
