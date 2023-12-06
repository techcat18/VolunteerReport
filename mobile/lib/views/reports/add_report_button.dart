import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddReportButton extends StatelessWidget {
  const AddReportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 74,
      height: 74,
      child: IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        ),
        color: Colors.white,
        icon: SvgPicture.asset("assets/add_icon.svg"),
      ),
    );
  }
}
