/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owlet_flutter/owlets.dart';

import '../base/theme.dart';
import '../src/theme/theme_shared.dart';

class AppTheme extends LightDarkObject<ThemeData> with ThemeModeGetter<ThemeData>, ChangeNotifier {
  AppTheme({
    ThemeMode themeMode = ThemeMode.light,
  })  : _themeMode = themeMode,
        super();

  final ThemeMode _themeMode;
  final AppThemeBuilder _themeBuilder = AppThemeLight(
    appSchemes: AppSchemesLight(),
    textTheme: GoogleFonts.nunitoTextTheme(Typography.englishLike2021),
  );
  final AppThemeBuilder _themeDarkBuilder = AppThemeDark(
    appSchemes: AppSchemesDart(),
    textTheme: GoogleFonts.nunitoTextTheme(Typography.englishLike2021),
  );

  @override
  ThemeData? get darkValueImpl => _themeDarkBuilder.theme;

  @override
  ThemeData? get lightValueImpl => _themeBuilder.theme;

  @override
  ThemeMode get themeMode => _themeMode;

  AppThemeBuilder get themeBuilder {
    switch (finalBrightness) {
      case Brightness.light:
        return _themeBuilder;
      case Brightness.dark:
        return _themeDarkBuilder;
    }
  }
}
