import 'package:dartz/dartz.dart';
import 'package:flutter_rest_api/core/error/failur.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failur, Type>> call(Params params);
}
