import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:resido_app/core/utils/simple_bloc_observer.dart';
import 'package:resido_app/resido_app.dart';

import 'constance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpServiceLocator();
  await getIt.get<CashHelperSharedPreferences>().init();
  Bloc.observer = SimpleBlocObserver();
  getThemeMode();
  runApp(const ResidoApp());
}
