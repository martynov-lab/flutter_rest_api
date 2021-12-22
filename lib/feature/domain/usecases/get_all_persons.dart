import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rest_api/core/error/failur.dart';
import 'package:flutter_rest_api/core/usecases/usecase.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/feature/domain/repositories/person_repository.dart';

class GetAllPersons extends UseCase<List<PersonEntity>, PagePersonParams> {
  final PersonRepository personRepository;

  GetAllPersons(this.personRepository);

  @override
  Future<Either<Failure, List<PersonEntity>>> call(
      PagePersonParams params) async {
    return await personRepository.getAllPersons();
  }
}

class PagePersonParams extends Equatable {
  final int page;

  const PagePersonParams({required this.page});
  @override
  List<Object?> get props => [page];
}
