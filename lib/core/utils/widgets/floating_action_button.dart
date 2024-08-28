import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:resido_app/core/utils/widgets/custom_go_navigator.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, required this.function});
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIconTheme: const IconThemeData(color: AppColors.white),
      animatedIcon: AnimatedIcons.add_event,
      backgroundColor: AppColors.primaryColor,
      shape: const CircleBorder(),
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      children: [
        SpeedDialChild(
          child: const Icon(
            Icons.discount,
            color: AppColors.white,
          ),
          label: AppLocalizations.of(context)!.forSale,
          backgroundColor: AppColors.primaryColor,
          onTap: () {
            // Action when tapped
            customJustGoNavigate(
                context: context, path: AppRouter.kAddProperties);
          },
        ),
        SpeedDialChild(
          child: const Icon(
            Icons.real_estate_agent,
            color: AppColors.white,
          ),
          label: AppLocalizations.of(context)!.forRent,
          backgroundColor: AppColors.primaryColor,
          onTap: () {
            // Action when tapped
          },
        ),
      ],
    );
  }
}
