import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/core/error/failur.dart';
import 'package:flutter_rest_api/feature/domain/usecases/search_person.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/search_bloc/search_state.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPerson searchPerson;

  PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty()) {
    on<SearchPersons>(_onEvent);
  }

  Future<void> _onEvent(
      SearchPersons event, Emitter<PersonSearchState> emit) async {
    emit(PersonSearchLoading());
    final failureOrPerson =
        await searchPerson(SearchPersonParams(query: event.personQuery));
    emit(failureOrPerson.fold(
        (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
        (person) => PersonSearchLoaded(persons: person)));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unexpected Error';
    }
  }
}

// class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
//   final SearchPerson searchPerson;
//   PersonSearchBloc({required this.searchPerson}) : super(PersonSearchEmpty());

//   //@override
//   Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
//     if (event is SearchPersons) {
//       yield* _mapFetchPersonsToState(event.personQuery);
//     }
//   }

//   Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
//     yield PersonSearchLoading();

//     final failureOrPerson =
//         await searchPerson(SearchPersonParams(query: personQuery));

//     yield failureOrPerson.fold(
//       (failure) => PersonSearchError(message: _mapFailurToMessage(failure)),
//       (person) => PersonSearchLoaded(persons: person),
//     );
//   }

//   String _mapFailurToMessage(Failure failure) {
//     switch (failure.runtimeType) {
//       case ServerFailure:
//         return 'Server Failure';
//       case CacheFailure:
//         return 'Cache Failure';
//       default:
//         return 'Unexpected Error';
//     }
//   }
// }
