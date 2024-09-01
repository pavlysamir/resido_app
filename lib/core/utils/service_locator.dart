import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:resido_app/core/api/dio_consumer.dart';
import 'package:resido_app/features/authentications/data/repo/auth_repo_impl.dart';
import 'package:resido_app/features/favourite/data/repository/favorite_repository.dart';
import 'package:resido_app/features/home/data/repo/home_repo_impl.dart';
import 'package:resido_app/features/profile/profile_main/data/repository/profile_main_repository.dart';
import 'package:resido_app/features/search/data/repo/search_repo_impl.dart';

import '../../features/profile/profile_edite/data/repository/profile_edit_repository.dart';
import '../api/api_consumer.dart';
import 'shared_preferences_cash_helper.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<CashHelperSharedPreferences>(
      CashHelperSharedPreferences());

  getIt.registerSingleton<DioConsumer>(DioConsumer(
    dio: Dio(),
  ));

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    api: getIt.get<DioConsumer>(),
  ));
  getIt.registerSingleton<ProfileEditRepositoryImpl>(ProfileEditRepositoryImpl(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
    api: getIt.get<DioConsumer>(),
  ));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    api: getIt.get<DioConsumer>(),
  ));

  // Register ProfileEditRepositoryImpl
  getIt.registerLazySingleton<ProfileEditRepository>(
    () => ProfileEditRepositoryImpl(api: getIt<ApiConsumer>()),
  );
  getIt.registerSingleton<FavoriteRepositoryImpl>(FavoriteRepositoryImpl(
    api: getIt.get<DioConsumer>(),
  ));
  getIt.registerSingleton<ProfileMainRepositoryImpl>(ProfileMainRepositoryImpl(
    api: getIt.get<DioConsumer>(),
  ));
}
