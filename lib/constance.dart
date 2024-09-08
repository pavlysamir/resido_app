import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'core/constants.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_preferences_cash_helper.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool isSelected = false;

Map<String, dynamic> selecties = {};

Map<String, int> ss = {};

bool isEnglish = false;

// String? token = '';
// String? token = '';
Future<void> getThemeMode() async {
  isDark= await getIt.get<CashHelperSharedPreferences>().getData(key: Constants.themeKey) ?? false;
 // Logger().i(' result is $isDark');
  isDark = await getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: Constants.themeKey) ??
      false;
  Logger().i(' result is $isDark');
}

bool isDark = false;

