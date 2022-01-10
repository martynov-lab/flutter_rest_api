import 'package:dartz/dartz.dart';
import 'package:flutter_rest_api/core/error/failur.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/feature/domain/repositories/person_repository.dart';

class GetAllPersons {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  Future<Either<Failure, List<PersonEntity>>> getPersonBy() async {
    return await personRepository.getAllPersons();
  }
}
