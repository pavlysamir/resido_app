import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<String, void>> search(String keword);
}
