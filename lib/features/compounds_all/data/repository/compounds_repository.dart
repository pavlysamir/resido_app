import 'package:dartz/dartz.dart';
import 'package:resido_app/features/compounds_all/data/models/compounds_model.dart';

import '../../../../core/api/api_consumer.dart';

abstract class  CompoundsRepository {

  Future<Either<String, CompoundModel>> getCompounds(int number);
  Future<Either<String, dynamic>> removeItemFromCompounds(int data);


}

class CompoundRepositoryImpl extends CompoundsRepository {
  final ApiConsumer api;
  CompoundRepositoryImpl({required this.api});

  @override
  Future<Either<String, CompoundModel>> getCompounds(int number) async {
    try {
      final response = await api.get('https://ai.w-manage.org/api/compounds/$id');
      final compound = CompoundModel.fromJson(response);
      return Right(compound);
    } catch (error) {
      return Left(error.toString());
    }
  }
  @override
  Future<Either<String, dynamic>> removeItemFromCompounds(int data) {
    // TODO: implement removeItemFromCompounds
    throw UnimplementedError();
  }

}