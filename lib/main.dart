import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_rest_api/feature/presentation/pages/person_screen.dart';
import 'package:flutter_rest_api/locator_service.dart' as di;

import 'common/app_theme.dart';
import 'feature/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PersonListCubit>(
            create: (context) => sl<PersonListCubit>()..loadPerson()),
        BlocProvider<PersonSearchBloc>(
            create: (context) => sl<PersonSearchBloc>()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeData? themeData;
          bool isThemeDark = false;
          if (state is ThemeChangedState) {
            themeData = state.themeData;
            isThemeDark = state.isDarkTheme ?? false;
          }
          return MaterialApp(
            theme: themeData ?? themeLight,
            home: HomePage(isThemeDark: isThemeDark),
          );
        },
      ),
    );
  }
}
