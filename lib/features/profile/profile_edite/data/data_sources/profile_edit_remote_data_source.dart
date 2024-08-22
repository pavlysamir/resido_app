import 'package:dio/dio.dart';
import 'package:resido_app/core/api/end_ponits.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../models/profile_edit_model.dart';

abstract class BaseProfileEditRemoteDataSource {
  Future<DataProfileEditModel> getProfileEdit();
}

class ProfileEditRemoteDataSource extends BaseProfileEditRemoteDataSource {
  @override
  Future<DataProfileEditModel> getProfileEdit() async {
    final response = await Dio().get(EndPoint.getProfileEndPoint);
    if (response.statusCode == 200) {
      return DataProfileEditModel.fromJson(response.data);
    } else {
      throw ServerException(
        errModel: ErrorModel.fromJson(response.data),
      );
    }
  }
}
