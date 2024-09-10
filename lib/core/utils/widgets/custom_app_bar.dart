import 'package:flutter/material.dart';
import 'package:resido_app/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Function() function;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 16.0, bottom: 15.0, right: 16.0),
      child: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.white,
        title: Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        leading: showBackButton
            ? IconButton(
                icon:
                    const Icon(Icons.arrow_back, color: AppColors.primaryColor),
                onPressed: function,
              )
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
