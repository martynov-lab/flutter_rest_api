import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/feature/domain/entities/person_entity.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:flutter_rest_api/feature/presentation/widgets/person_card_widget.dart';

class PersonsList extends StatelessWidget {
  final scrollController = ScrollController();

  PersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListCubit, PersonState>(
        builder: (BuildContext context, state) {
      List<PersonEntity> persons = [];

      if (state is PersonLoading) {
        return _loadingIndicator();
      } else if (state is PersonLoading) {
        persons = state.oldPersonsList;
      } else if (state is PersonLoaded) {
        persons = state.personsList;
      } else if (state is PersonError) {
        return Text(state.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ));
      }
      return ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < persons.length) {
            return PersonCard(person: persons[index]);
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
            return _loadingIndicator();
          }
        },
        itemCount: persons.length,
      );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
