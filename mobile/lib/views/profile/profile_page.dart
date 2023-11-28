import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/views/profile/profile_details.dart';
import 'package:mobile/views/reports/reports_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _closeAccountView(BuildContext context) {
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
        onPressed: () => _closeAccountView(context),
        icon: SvgPicture.asset("assets/cross_icon.svg"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: const SafeArea(
        child: CustomScrollView(
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
        ),
      ),
    );
  }
}
