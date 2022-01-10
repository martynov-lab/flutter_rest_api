import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api/common/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState()) {
    on<ThemeToggle>((ThemeToggle event, Emitter<ThemeState> emit) {
      if (event.isDarkTheme) {
        emit(ThemeChangedState(themeLight, !event.isDarkTheme));
      } else {
        emit(ThemeChangedState(themeDark, !event.isDarkTheme));
      }
    });
  }
}
