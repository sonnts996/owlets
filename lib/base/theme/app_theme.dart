/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:owlet_flutter/owlets.dart';

import 'app_components.dart';
import 'app_scheme.dart';
import 'components/app_animations.dart';
import 'components/app_decorations.dart';

class AppTheme extends LightDarkObject<ThemeData> with ThemeModeGetter<ThemeData>, ChangeNotifier {
  AppTheme({
    ThemeMode themeMode = ThemeMode.system,
    this.appSchemes = const AppSchemes(),
  })  : _themeMode = themeMode,
        super();

  ThemeMode _themeMode;

  final AppSchemes appSchemes;

  final TextTheme origin = GoogleFonts.openSansTextTheme();

  AppComponents get component => current.extension<AppComponents>()!;

  @override
  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  @override
  ThemeData? get darkValueImpl => ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: appSchemes.dark,
          textTheme: origin.apply(
            bodyColor: Color(0xFFFFFFFF),
            displayColor: Color(0xFFFFFFFF),
          ),
          extensions: [
            AppComponents(
              animations: AppAnimations(),
              decoration: AppDecoration(
                  colorScheme: appSchemes.dark,
                  textTheme: origin.apply(
                    bodyColor: Color(0xFFFFFFFF),
                    displayColor: Color(0xFFFFFFFF),
                  )),
            )
          ]);

  @override
  ThemeData? get lightValueImpl => ThemeData.light(useMaterial3: true).copyWith(
          colorScheme: appSchemes.light,
          scaffoldBackgroundColor: appSchemes.light.background,
          textTheme: origin.apply(
            bodyColor: Color(0xFF424242),
            displayColor: Color(0xFF424242),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            iconSize: 32,
            foregroundColor: appSchemes.light.onPrimary,
          ),
          appBarTheme: AppBarTheme(
            elevation: 0,
            foregroundColor: appSchemes.light.onPrimary,
          ),
          extensions: [
            AppComponents(
              animations: AppAnimations(),
              decoration: AppDecoration(
                  colorScheme: appSchemes.light,
                  textTheme: origin.apply(
                    bodyColor: Color(0xFF424242),
                    displayColor: Color(0xFF424242),
                  )),
            )
          ]);
}
