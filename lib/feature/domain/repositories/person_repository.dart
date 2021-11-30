import 'package:flutter_rest_api/core/error/failur.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query);
}
