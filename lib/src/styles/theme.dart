import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

final ThemeData appTheme = _buildTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    // deprecated :/ change later
    bodyLarge: TextStyles.body1,
  );
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    hintColor: AppColors.accent,
  );

  // for better back transition
// PageTransitionsTheme _pageTransitionsTheme = PageTransitionsTheme(
//   builders: <TargetPlatform, PageTransitionsBuilder>{
//     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//   },
// );

  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    // pageTransitionsTheme: _pageTransitionsTheme,
  );
}
