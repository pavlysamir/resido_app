import 'package:dartz/dartz.dart';
import 'package:resido_app/core/errors/exceptions.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../core/utils/shared_preferences_cash_helper.dart';
import '../models/profile_edit_model.dart';

abstract class ProfileEditRepository {
  Future<Either<String, DataProfileEditModel>> getProfileEdit();
  Future<Either<String, DataProfileEditModel>> updateProfileEdit(
      DataProfileEditModel profileEditModel);
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
      DataProfileEditModel profileEditModel) async {
    try {
      final response =
          await api.put((EndPoint.getProfileEndPoint), queryParameters: {
        'name': profileEditModel.name,
        'email': profileEditModel.email,
        'phone': profileEditModel.phone,
        'address': profileEditModel.address,
        'image': profileEditModel.image,
      });
      var updatedProfile = DataProfileEditModel.fromJson(response['data']);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.userName, value: profileEditModel.name);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.email, value: profileEditModel.email);

      if (profileEditModel.image != null) {
        getIt.get<CashHelperSharedPreferences>().saveData(
            key: ApiKey.IMAGE_PROFILE_KEY, value: profileEditModel.image);
      }
      return Right(updatedProfile);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
