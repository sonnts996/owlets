/*
 Created by Thanh Son on 06/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

class AppSchemes extends LightDartCustomize<ColorScheme> {
  const AppSchemes()
      : super(
            light: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFF0054d6),
              onPrimary: Color(0xFFFFFFFF),
              secondary: Color(0xFF585e71),
              onSecondary: Color(0xFFFFFFFF),
              tertiary: Color(0xFF735571),
              onTertiary: Color(0xFFffffff),
              error: Color(0xFFba1b1b),
              onError: Color(0xFFFFFFFF),
              background: Color(0xFFf1f1f1),
              onBackground: Color(0xFF1b1b1e),
              surface: Color(0xFFfefefe),
              onSurface: Color(0xFF1b1b1e),
              inverseSurface: Color(0xFF303033),
              onInverseSurface: Color(0xFFf2f0f5),
              inversePrimary: Color(0xFFb0c5ff),
              surfaceVariant: Color(0xFFe2e2ec),
              onSurfaceVariant: Color(0xFF44464e),
              outline: Color(0xFF75767f),
              shadow: Color(0xFF000000),
              primaryContainer: Color(0xFFd9e2ff),
              onPrimaryContainer: Color(0xFF00184a),
              secondaryContainer: Color(0xFFdde2fa),
              onSecondaryContainer: Color(0xFF151b2c),
              tertiaryContainer: Color(0xFFfed6f9),
              onTertiaryContainer: Color(0xFF2b122c),
              errorContainer: Color(0xFFffdad4),
              onErrorContainer: Color(0xFF410001),
            ),
            dark: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFFbfc1ff),
              onPrimary: Color(0xFF0c00ab),
              secondary: Color(0xFFc6c4dc),
              onSecondary: Color(0xFF2f2f42),
              tertiary: Color(0xFFe8b9d3),
              onTertiary: Color(0xFF46263a),
              error: Color(0xFFffb4a9),
              onError: Color(0xFF680003),
              background: Color(0xFF1b1b1f),
              onBackground: Color(0xFFe4e1e6),
              surface: Color(0xFF1b1b1f),
              onSurface: Color(0xFFe4e1e6),
              inverseSurface: Color(0xFFe4e1e6),
              onInverseSurface: Color(0xFF313033),
              inversePrimary: Color(0xFF413ff4),
              surfaceVariant: Color(0xFF47464f),
              onSurfaceVariant: Color(0xFFc8c5d0),
              outline: Color(0xFF918f99),
              shadow: Color(0xFF000000),
              primaryContainer: Color(0xFF2317de),
              onPrimaryContainer: Color(0xFFe0e0ff),
              secondaryContainer: Color(0xFF454559),
              onSecondaryContainer: Color(0xFFe2e0f9),
              tertiaryContainer: Color(0xFF5f3c51),
              onTertiaryContainer: Color(0xFFffd7ed),
              errorContainer: Color(0xFF930006),
              onErrorContainer: Color(0xFFffb4a9),
            ));
}
