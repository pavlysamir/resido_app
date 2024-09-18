
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

class AccountDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String imagePath;
  final List<Widget> actions;

  const AccountDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.imagePath,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imageWidth = screenSize.width * 0.25; // 25% of screen width
    final imageHeight = screenSize.height * 0.35; // 25% of screen height

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            imagePath, // Replace with the correct SVG image path
            width: 400,
            height: 250,
          ),
          const SizedBox(height: 16.0),
          Text(
              title,
              style: Styles.textStyle18BoldPrimary
          ),
          const SizedBox(height: 8.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Styles.textStyleDarkGrey,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: actions,
          )
        ],
      ),
    );
  }
}
