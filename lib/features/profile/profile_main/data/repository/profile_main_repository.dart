import 'package:dartz/dartz.dart';
import 'package:resido_app/features/profile/profile_main/data/model/delete_model.dart';
import 'package:resido_app/features/profile/profile_main/data/model/logout_model.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/errors/exceptions.dart';

abstract class ProfileMainRepository{
  Future<Either<String, String>> logout();
  Future<Either<String, DeleteModel>> deleteAccount();
}
class ProfileMainRepositoryImpl extends ProfileMainRepository {
  final ApiConsumer api;
  ProfileMainRepositoryImpl({required this.api});

  @override
  Future<Either<String, String>> logout() async {
    try {
      final response = await api.post(EndPoint.logout);
      if (response != null && response['data'] != null && response['data'].isNotEmpty) {
        var data = response['data'][0];
        return Right(data);
      } else {
        return Left('No data received');
      }
    } on ServerException catch (error) {
      return Left(error.errModel.errorMessage![0] ?? 'Server error');
    }
  }

  @override
  Future<Either<String, DeleteModel>> deleteAccount() async {
    try {
      final response = await api.delete(EndPoint.deleteAccountAPI);
      var data = DeleteModel.fromJson(response['data']);
      return Right(data);
    } on ServerException catch (error) {
      return Left(error.errModel.errorMessage![0] ?? 'Server error');
    }
  }
}