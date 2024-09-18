import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class HeaderWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showArrow;
  final bool showFilterIcon;
  final EdgeInsetsGeometry padding;

  const HeaderWidget({
    Key? key,
    this.title = 'Edit Profile',
    this.showArrow = true,
    this.showFilterIcon = false,
    this.padding = const EdgeInsets.only(left: 16.0, bottom: 15.0, right: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: padding,
      child: Row(
        children: [
          if (showArrow)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Spacer(),
          if (showFilterIcon)
            IconButton(
              icon: const Icon(Icons.filter_list, color: AppColors.primaryColor),
              onPressed: () {
                // Add your filter action here
              },
            ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}