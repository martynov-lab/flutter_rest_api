import 'package:flutter_rest_api/core/error/exeption.dart';
import 'package:flutter_rest_api/core/platform/network_info.dart';
import 'package:flutter_rest_api/feature/data/datasources/person_local_data_source.dart';
import 'package:flutter_rest_api/feature/data/datasources/person_remote_data_source.dart';
import 'package:flutter_rest_api/feature/data/models/person_model.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/core/error/failur.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_rest_api/feature/domain/repositories/person_repository.dart';

class PresonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PresonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons() async {
    return await _getPersons(() {
      return remoteDataSource.getAllPersons();
    });
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String query) async {
    return await _getPersons(() {
      return remoteDataSource.searchPerson(query);
    });
  }

  Future<Either<Failure, List<PersonModel>>> _getPersons(
      Future<List<PersonModel>> Function() getPersons) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePerson = await getPersons();
        localDataSource.personsToCache(remotePerson);
        return Right(remotePerson);
      } on ServerExeption {
        return Left(ServerFailure());
      }
    } else {
      try {
        final locationPerson = await localDataSource.getLastPersonsFromCache();
        return Right(locationPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
