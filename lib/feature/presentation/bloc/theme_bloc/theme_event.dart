part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ThemeToggle extends ThemeEvent {
  final bool isDarkTheme;
  const ThemeToggle(this.isDarkTheme);
}
