import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ContainerSwitcher extends StatelessWidget {
  const ContainerSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ToggleSwitch(
        minWidth: 300.w,
        minHeight: 50.h,
        activeBgColor: [AppColors.primaryColor],
        activeFgColor: Colors.white,
        inactiveBgColor: Color.fromARGB(255, 215, 227, 215),
        inactiveFgColor: Colors.grey[900],
        initialLabelIndex: 0,
        totalSwitches: 2,
        labels: [
          AppLocalizations.of(context)!.sell,
          AppLocalizations.of(context)!.rent
        ],
        onToggle: (index) {
          print('switched to: $index');
        },
      ),
    );
  }
}
