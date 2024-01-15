/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

@immutable
abstract class AppSchemes {
  const AppSchemes({
    required this.scheme,
    required this.bodyColor,
    required this.displayColor,
    required this.darkShadow,
  });

  final ColorScheme scheme;

  final Color bodyColor;
  final Color displayColor;

  final Color darkShadow;
}

abstract class AppThemeBuilder {
  AppThemeBuilder({
    required this.appSchemes,
    required this.textTheme,
  });

  final AppSchemes appSchemes;
  final TextTheme textTheme;

  ColorScheme get scheme => appSchemes.scheme;

  ThemeData get theme;
}
