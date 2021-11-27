import 'dart:convert';

import 'package:flutter_rest_api/core/error/exeption.dart';
import 'package:flutter_rest_api/feature/data/models/person_model.dart';
import 'package:flutter_rest_api/feature/domain/usecases/get_all_persons.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> getAllPersons(int page);

  /// Calls the https://rickandmortyapi.com/api/character/?name=rick endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImp implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImp({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons(int page) => _getPersonFromUrl(
      'https://rickandmortyapi.com/api/character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String query) => _getPersonFromUrl(
      'https://rickandmortyapi.com/api/character/?name=$query');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Contert-Type': 'application/json'});
    if (response.statusCode == 200) {
      final person = json.decode(response.body);
      return (person['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerExeption();
    }
  }
}
