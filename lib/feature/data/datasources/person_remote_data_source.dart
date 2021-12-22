import 'dart:convert';

import 'package:flutter_rest_api/core/error/exeption.dart';
import 'package:flutter_rest_api/feature/data/models/person_model.dart';
import 'package:http/http.dart' as http;

abstract class PersonRemoteDataSource {
  /// Calls the https://rickandmortyapi.com/api/character/?page=1 endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> getAllPersons();

  /// Calls the https://rickandmortyapi.com/api/character/?name=rick endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<PersonModel>> searchPerson(String query);
}

class PersonRemoteDataSourceImp implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourceImp({required this.client});

  @override
  Future<List<PersonModel>> getAllPersons() => _getPersonFromUrl(
      'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json');
  //'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json'

  @override
  Future<List<PersonModel>> searchPerson(String query) => _getPersonFromUrl(
      'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/name/$query.json');
  //'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/name/$query.json'

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    print(url);
    final response = await client
        .get(Uri.parse(url), headers: {'Contert-Type': 'application/json'});
    if (response.statusCode == 200) {
      final person = json.decode(response.body);
      return (person as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerExeption();
    }
  }
}
