import 'package:flutter/material.dart';

ThemeData _themeLight = ThemeData.light();
ThemeData _themeDark = ThemeData.dark();

ThemeData themeLight = _themeLight.copyWith(
  appBarTheme: AppBarTheme(color: Colors.grey[400]),
  textTheme: _textLight(_themeLight.textTheme),
  scaffoldBackgroundColor: Colors.grey[200],
  cardTheme: CardTheme(color: Colors.grey[300]),
);

ThemeData themeDark = _themeDark.copyWith(
  appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
  scaffoldBackgroundColor: Colors.grey[700],
  textTheme: _textDark(_themeDark.textTheme),
  cardTheme: CardTheme(color: Colors.grey[800]),
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    bodyText1: base.bodyText1
        ?.copyWith(color: Colors.grey[400], fontWeight: FontWeight.w800),
    bodyText2: base.bodyText2?.copyWith(color: Colors.grey[600]),
  );
}

TextTheme _textDark(TextTheme base) {
  return base.copyWith(
    bodyText1: base.bodyText1
        ?.copyWith(color: Colors.grey[100], fontWeight: FontWeight.w800),
    bodyText2: base.bodyText2?.copyWith(color: Colors.grey[200]),
  );
}

// enum AppTheme {
//   themeLight,
//   themeDark,
// }

// final appThemeData = {
//   AppTheme.themeLight: ThemeData(
//     brightness: Brightness.light,
//     primaryColor: Colors.grey[400],
//   ),
//   AppTheme.themeDark: ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: Colors.blueGrey[900],
//   )
// };
