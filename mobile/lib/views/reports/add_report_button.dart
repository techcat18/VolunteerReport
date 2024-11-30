import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/views/edit_report/edit_report_page.dart';

class AddReportButton extends StatelessWidget {
  const AddReportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 74,
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const EditReportPage(),
            ),
          );
        },
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        color: Colors.white,
        icon: SvgPicture.asset('assets/icons/add_icon.svg'),
      ),
    );
  }
}
