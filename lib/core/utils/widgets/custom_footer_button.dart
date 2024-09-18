import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/styles.dart';

class CustomFooterButton extends StatelessWidget {
  const CustomFooterButton(
      {super.key,
      required this.function,
      required this.text,
      this.color = AppColors.primaryColor,
      this.textColortcolor = Colors.white,
      this.width = 78,
      required this.borderColor,
      required this.icon});
  final Function() function;
  final String text;
  final Color color;
  final Color textColortcolor;
  final double width;
  final Color borderColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: function,
        child: Container(
          height: 45.h,
          width: 100.w,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 30,
                    color: AppColors.white,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Text(
                    text,
                    style: Styles.textStyle14White
                        .copyWith(color: textColortcolor),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
