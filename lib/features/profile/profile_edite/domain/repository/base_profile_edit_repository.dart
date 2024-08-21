import 'package:dartz/dartz.dart';
import 'package:resido_app/features/profile/profile_edite/domain/entities/profile_edit.dart';

import '../../../../../core/errors/failure.dart';

abstract class BaseProfileEditRepository {

  Future<Either<Failure, ProfileEdit>> getProfileEditDetails();
}