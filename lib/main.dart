import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:resido_app/core/utils/simple_bloc_observer.dart';
import 'package:resido_app/resido_app.dart';

import 'constance.dart';
import 'core/api/end_ponits.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpServiceLocator();
  await getIt.get<CashHelperSharedPreferences>().init();
  token = await getIt
          .get<CashHelperSharedPreferences>()
          .getData(key: ApiKey.token) ??
      null;
  Bloc.observer = SimpleBlocObserver();
  getThemeMode();
  runApp(const ResidoApp());
}
