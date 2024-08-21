import 'package:dartz/dartz.dart';
import 'package:resido_app/core/api/api_consumer.dart';
import 'package:resido_app/core/api/end_ponits.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import 'package:resido_app/core/utils/service_locator.dart';
import 'package:resido_app/core/utils/shared_preferences_cash_helper.dart';
import 'package:resido_app/features/authentications/data/models/login_model.dart';
import 'package:resido_app/features/authentications/data/models/register_model.dart';
import 'package:resido_app/features/authentications/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer api;
  AuthRepoImpl({required this.api});

  @override
  Future<Either<String, DataUserLogin>> login(
      String email, String password) async {
    try {
      final response = await api.post(EndPoint.login, queryParameters: {
        'email': email,
        'password': password,
      });

      var data = DataUserLogin.fromJson(response['data']);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: data.user.id);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.userName, value: data.user.name);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.token, value: data.token);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.token, value: data.user.email);

      if (data.user.image != null) {
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.token, value: data.user.image);
      }

      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage ?? 'Server error');
    }
  }

  @override
  Future<Either<String, String>> forgetPassword(
      {required String mobileNo}) async {
    try {
      final response = await api.post(EndPoint.forgotPassword, data: {
        'phoneNumber': '${'+2'}$mobileNo',
      });

      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  @override
  Future<Either<String, DataUserRegister>> signUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(EndPoint.signUp, queryParameters: {
        "name": userName,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      var data = DataUserRegister.fromJson(response['data']);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: data.token);
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
