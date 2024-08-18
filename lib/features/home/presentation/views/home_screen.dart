import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_banner_home.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_listView_properties_home.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_listView_unit.dart';
import 'package:resido_app/features/home/presentation/widgets/custom_search_decoration.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const CustomSearchDecoration(),
            SizedBox(
              height: 16.h,
            ),
            const CustomBannerHome(),
            SizedBox(
              height: 14.h,
            ),
            const CustomPropertyHomeListview(),
            SizedBox(
              height: 18.h,
            ),
            Text(
              AppLocalizations.of(context)!.featureProb,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 14.h,
            ),
            const CustomUnitListview()
          ],
        ),
      ),
    ));
  }
}
