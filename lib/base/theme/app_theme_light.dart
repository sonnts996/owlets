/*
 Created by Thanh Son on 30/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owlet_flutter/owlets.dart';

import 'app_components.dart';
import 'components/app_animations.dart';
import 'components/app_decorations.dart';

class AppThemeLight {
  AppThemeLight({required this.scheme, required this.textTheme});

  final ColorScheme scheme;
  final TextTheme textTheme;
  late final ThemeData theme = ThemeData.light(useMaterial3: true).copyWith(
      primaryColor: const Color(0xff0066ff),
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.background,
      canvasColor: scheme.background,
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      }),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        modalBackgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        dragHandleColor: scheme.surface,
        modalElevation: 0,
        showDragHandle: false,
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outline.withOpacity(0.2),
        thickness: 1,
        space: 4,
        indent: 16,
        endIndent: 16,
      ),
      textTheme: textTheme,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        iconSize: 32,
        foregroundColor: scheme.onPrimary,
        sizeConstraints: const BoxConstraints(minHeight: 50, minWidth: 50),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: scheme.background,
        surfaceTintColor: scheme.background,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            systemNavigationBarColor: scheme.background,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
      ),
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        errorStyle: const TextStyle(height: 0, fontSize: 0),
        fillColor: scheme.surface,
        filled: true,
        enabledBorder: OutlineInputBorder(borderRadius: 8.circleBorderRadius, borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: scheme.inversePrimary, width: 1)),
        disabledBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: scheme.secondary, width: 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: scheme.errorContainer, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: scheme.inversePrimary, width: 1)),
        hintStyle: textTheme.bodyMedium?.apply(color: scheme.outline),
      ),
      extensions: [
        AppComponents(
          animations: const AppAnimations(),
          decoration: AppDecoration(
              colorScheme: scheme,
              textTheme: textTheme.apply(
                bodyColor: const Color(0xFF424242),
                displayColor: const Color(0xFF424242),
              )),
        )
      ]);
}
