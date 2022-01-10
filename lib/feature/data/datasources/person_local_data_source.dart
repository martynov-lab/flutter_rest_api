import 'package:flutter_rest_api/feature/data/models/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_rest_api/core/error/exeption.dart';
import 'dart:convert';

abstract class PersonLocalDataSource {
  /// Gets the cached [List<PersonModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.

  Future<List<PersonModel>> getLastPersonsFromCache();
  Future<void> personsToCache(List<PersonModel> persons);
}

const cachedPersonsList = 'CACHED_PERSONS_LIST';

class PersonLocalDataSourceImp implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImp({required this.sharedPreferences});
  @override
  Future<List<PersonModel>> getLastPersonsFromCache() {
    final jsonPersonsList = sharedPreferences.getStringList(cachedPersonsList);
    if (jsonPersonsList!.isNotEmpty) {
      return Future.value(jsonPersonsList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> personsToCache(List<PersonModel> persons) {
    final List<String> jsonPersonList =
        persons.map((person) => json.encode(person.toJson())).toList();
    sharedPreferences.setStringList(cachedPersonsList, jsonPersonList);
    return Future.value(jsonPersonList);
  }
}
