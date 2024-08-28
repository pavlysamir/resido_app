import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:resido_app/core/errors/exceptions.dart';
import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences_cash_helper.dart';
import '../models/profile_edit_model.dart';

abstract class ProfileEditRepository {
  Future<Either<String, DataProfileEditModel>> getProfileEdit();
  Future<Either<String, DataProfileEditModel>> updateProfileEdit(
      String? name, String? phone, String? address, String? image);
}

class ProfileEditRepositoryImpl extends ProfileEditRepository {
  final ApiConsumer api;
  ProfileEditRepositoryImpl({required this.api});

  @override
  Future<Either<String, DataProfileEditModel>> getProfileEdit() async {
    try {
      final response = await api.get((EndPoint.getProfileEndPoint));
      var data = DataProfileEditModel.fromJson(response['data']);
      return Right(data);
    } on ServerException catch (error) {
      return Left(error.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, DataProfileEditModel>> updateProfileEdit(
      String? name, String? phone, String? address, String? image) async {
    try {
      final response =
          await api.put((EndPoint.updateUserProfile), queryParameters: {
        'name': name,
        // 'email': email,
        'phone': phone,
        'address': address,
        if (image != null)
          'image': await MultipartFile.fromFile(image, filename: 'profile.png'),

        //  age': image,
      });
      var updatedProfile = DataProfileEditModel.fromJson(response['data']);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.userName, value: name);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.phone, value: phone);

      if (image != null) {
        getIt
            .get<CashHelperSharedPreferences>()
            .saveData(key: ApiKey.IMAGE_PROFILE_KEY, value: image);
      }
      return Right(updatedProfile);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
