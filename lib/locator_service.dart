import 'package:flutter_rest_api/core/platform/network_info.dart';
import 'package:flutter_rest_api/feature/data/datasources/person_local_data_source.dart';
import 'package:flutter_rest_api/feature/data/datasources/person_remote_data_source.dart';
import 'package:flutter_rest_api/feature/data/repositories/person_repository_impl.dart';
import 'package:flutter_rest_api/feature/domain/repositories/person_repository.dart';
import 'package:flutter_rest_api/feature/domain/usecases/get_all_persons.dart';
import 'package:flutter_rest_api/feature/domain/usecases/search_person.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
    () => PersonListCubit(getAllPersons: sl()),
  );
  sl.registerFactory(
    () => PersonSearchBloc(searchPerson: sl()),
  );
  // UseCases
  sl.registerLazySingleton(() => GetAllPersons(sl()));
  sl.registerLazySingleton(() => SearchPerson(sl()));
  // Repository
  sl.registerLazySingleton<PersonRepository>(
    () => PresonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PersonRemoteDataSource>(
    () => PersonRemoteDataSourceImp(client: http.Client()),
  );

  sl.registerLazySingleton<PersonLocalDataSource>(
    () => PersonLocalDataSourceImp(sharedPreferences: sl()),
  );
  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
