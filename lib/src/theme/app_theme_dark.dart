/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
part of 'app_theme.dart';

@immutable
class AppThemeDark extends AppThemeBuilder {
  AppThemeDark({
    required super.appSchemes,
    required super.textTheme,
  });

  late final ThemeData _theme = ThemeData.dark(useMaterial3: true).copyWith(
    primaryColor: scheme.primary,
    brightness: scheme.brightness,
    canvasColor: scheme.background,
    cardColor: scheme.background,
    colorScheme: scheme,
    shadowColor: Colors.transparent,
    textTheme: textTheme.apply(
      bodyColor: appSchemes.bodyColor,
      displayColor: appSchemes.displayColor,
    ),
  );

  @override
  ThemeData get theme => _theme;
}
