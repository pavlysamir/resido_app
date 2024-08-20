import 'package:dartz/dartz.dart';
import 'package:resido_app/features/authentications/data/models/login_model.dart';
import 'package:resido_app/features/authentications/data/models/register_model.dart';

abstract class AuthRepo {
  Future<Either<String, DataUserLogin>> login(String email, String password);

  Future<Either<String, DataUserRegister>> signUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  });

  Future<Either<String, String>> forgetPassword({required String mobileNo});

  // Future<Either<String, String>> verifyForgetPasswordOtp(
  //     {required String mobileNo,
  //     required String otp,
  //     required String newPassword});
}
