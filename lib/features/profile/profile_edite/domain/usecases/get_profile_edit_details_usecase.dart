
import 'package:dartz/dartz.dart';
import 'package:resido_app/features/profile/profile_edite/domain/entities/profile_edit.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../repository/base_profile_edit_repository.dart';

class GetProfileEditDetailsUseCase extends BaseUseCase<ProfileEdit, NoParameters> {
  final BaseProfileEditRepository profileEditRepository;

  GetProfileEditDetailsUseCase(this.profileEditRepository);

  @override
  Future<Either<Failure, ProfileEdit>> call(NoParameters parameters) async {
    return await profileEditRepository.getProfileEditDetails();
  }
}