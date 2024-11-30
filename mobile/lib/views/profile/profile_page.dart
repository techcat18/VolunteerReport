import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/bloc/user_bloc.dart';
import 'package:mobile/views/profile/profile_details.dart';
import 'package:mobile/views/reports/reports_page.dart';
import 'package:mobile/widgets/error_snack_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _closeProfileView(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ReportsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.secondaryContainer,
      floatingActionButton: IconButton(
        onPressed: () => _closeProfileView(context),
        icon: SvgPicture.asset("assets/icons/cross_icon.svg"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UpdateFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                ErrorSnackBar(
                  error: state.error,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is UserUpdating) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return const CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 75,
                      horizontal: 15,
                    ),
                    child: ProfileDetails(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
