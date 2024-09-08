import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resido_app/constance.dart';
import 'package:resido_app/core/Theme/Teme_data.dart';
import 'package:resido_app/core/utils/app_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/features/authentications/data/repo/auth_repo_impl.dart';
import 'package:resido_app/features/authentications/presentation/managers/register_cubit/register_cubit.dart';
import 'package:resido_app/features/authentications/presentation/managers/login_cubit/login_cubit.dart';
import 'package:resido_app/features/chat/presentation/managers/cubit/chat_cubit.dart';
import 'package:resido_app/features/favourite/logic/cubit/favorite_cubit.dart';
import 'package:resido_app/features/home/data/repo/home_repo_impl.dart';
import 'package:resido_app/features/home/presentation/managers/add_prob_cubit/add_proparties_cubit.dart';
import 'package:resido_app/features/home/presentation/managers/home_cubit/home_cubit.dart';
import 'package:resido_app/features/profile/profile_edite/data/repository/profile_edit_repository.dart';
import 'package:resido_app/features/search/data/repo/search_repo_impl.dart';
import 'package:resido_app/features/search/presentation/managers/cubit/search_cubit.dart';
import 'package:resido_app/l10n/l10n.dart';

import 'features/favourite/data/repository/favorite_repository.dart';
import 'features/profile/profile_edite/logic/profile_edit_cubit.dart';
import 'features/profile/profile_main/data/repository/profile_main_repository.dart';
import 'features/profile/profile_main/logic/profile_cubit.dart';

GlobalKey globalKey = GlobalKey();

class ResidoApp extends StatelessWidget {
  const ResidoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddPropartiesCubit()),
        BlocProvider(
            create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())
              ..getBanner()
              ..getFeatureProparties()
              ..getCategory()
              ..getCompounds()
              ..getMostLike()),
        BlocProvider(
            create: (context) => LoginCubit(getIt.get<AuthRepoImpl>())),
        BlocProvider(
            create: (context) => RegisterCubit(getIt.get<AuthRepoImpl>())),
        BlocProvider(
            create: (context) =>
                SearchCubit(getIt.get<SearchRepoImpl>())..getSubCategory()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(
            create: (context) =>
                ProfileCubit(getIt.get<ProfileMainRepositoryImpl>())
                  ..initializeLanguage()),
        BlocProvider(
            create: (context) =>
                ProfileEditCubit(getIt.get<ProfileEditRepositoryImpl>())
                  ..getProfileEdit()),
        BlocProvider(
            create: (context) =>
                FavoriteCubit(getIt.get<FavoriteRepositoryImpl>())
                  ..getFavorite()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return MaterialApp.router(
              key: globalKey,
              debugShowCheckedModeBanner: false,
              locale: isEnglish ? const Locale('en') : const Locale('ar'),
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: L10n.all,
              routerConfig: AppRouter.router,
              theme: isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            );
          },
        ),
      ),
    );
  }
}
