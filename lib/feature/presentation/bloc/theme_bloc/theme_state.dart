part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitialState extends ThemeState {}

class ThemeChangedState extends ThemeState {
  final ThemeData themeData;
  final bool? isDarkTheme;
  const ThemeChangedState(this.themeData, this.isDarkTheme);
  @override
  List<Object> get props => [themeData];
}
