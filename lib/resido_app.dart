import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/core/Theme/Teme_data.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/features/authentications/presentation/managers/cubit/register_cubit.dart';
import 'package:resido_app/features/authentications/presentation/managers/login_cubit/login_cubit.dart';
import 'package:resido_app/features/chat/presentation/managers/cubit/chat_cubit.dart';
import 'package:resido_app/features/home/presentation/managers/cubit/add_proparties_cubit.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/l10n/l10n.dart';

class ResidoApp extends StatelessWidget {
  const ResidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddPropartiesCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => ChatCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
