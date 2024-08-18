import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Assets/assets.dart';
import 'package:resido_app/core/utils/app_colors.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/styles.dart';
import '../data/models/onBoeding_model.dart';
import 'on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  bool isLast = false;
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();
  PageController boardTextController = PageController();

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> modelBoarding = [
      OnBoardingModel(
          image: AssetsData.onBprding_1,
          title: AppLocalizations.of(context)!.onBording_1,
          messege: AppLocalizations.of(context)!.description_onBording_1),
      OnBoardingModel(
          image: AssetsData.onBprding_2,
          title: AppLocalizations.of(context)!.onBording_2,
          messege: AppLocalizations.of(context)!.description_onBording_2),
      OnBoardingModel(
          image: AssetsData.onBprding_3,
          title: AppLocalizations.of(context)!.onBording_3,
          messege: AppLocalizations.of(context)!.description_onBording_3),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 228, 228),
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            submit();
          },
          child: Text(AppLocalizations.of(context)!.submit,
              style: Styles.textStyle14Grey),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) =>
                  BuildBoardingItem(model: modelBoarding[index]),
              itemCount: modelBoarding.length,
              physics: const BouncingScrollPhysics(),
              controller: boardController,
              onPageChanged: (int index) {
                if (index == modelBoarding.length - 1) {
                  setState(() {
                    print('last');
                    widget.isLast = true;
                  });
                } else {
                  setState(() {
                    print('not last');
                    widget.isLast = false;
                  });
                }
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 300.h,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void submit() {
    getIt
        .get<CashHelperSharedPreferences>()
        .saveData(key: 'onBoarding', value: true)
        .then((value) {
      //customGoAndDeleteNavigate(context: context, path: AppRouter.kLogin);
    });
  }
}
