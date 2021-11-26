import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PersonRepository {
  Future<Either<> <List<PersonEntity>> getAllPersons(int page);
  Future<List<PersonEntity>> searchPerson(String query);
}
