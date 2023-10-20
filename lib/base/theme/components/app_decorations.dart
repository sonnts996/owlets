/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

class AppDecoration {
  const AppDecoration({required this.colorScheme, required this.textTheme});

  final ColorScheme colorScheme;
  final TextTheme textTheme;

  List<BoxShadow> get primaryShadow {
    if (colorScheme.brightness == Brightness.light) {
      return [
        BoxShadow(
          color: colorScheme.shadow.withOpacity(0.04),
          blurRadius: 10,
          spreadRadius: 4,
          offset: Offset(0, 5),
        ),
        BoxShadow(
          color: colorScheme.shadow.withOpacity(0.023),
          blurRadius: 10,
          spreadRadius: 6,
          offset: Offset(0, 10),
        )
      ];
    }
    return [];
  }

  EdgeInsets get normalFieldInset => EdgeInsets.symmetric(vertical: 8, horizontal: 12);

  Gradient get primaryGradient => LinearGradient(colors: [
        Color(0xFF4D4DFF),
        Color(0xFF4784FA),
      ], begin: Alignment.centerRight, end: Alignment.bottomLeft);

  Gradient get higherGradient => LinearGradient(colors: [
        Color(0xFF4D4DFF),
        Color(0xFF0000FF),
      ], stops: [
        0.4,
        1
      ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  BoxDecoration get primaryButton => BoxDecoration(gradient: primaryGradient, borderRadius: 100.circleBorderRadius);

  BoxDecoration get secondaryButton => BoxDecoration();

  BoxDecoration get primaryTile => BoxDecoration(gradient: primaryGradient, borderRadius: 16.circleBorderRadius);

  BoxDecoration get secondaryTile =>
      BoxDecoration(color: colorScheme.surface, borderRadius: 24.circleBorderRadius,);

  /// AppForm
  BoxDecoration get fieldBackground => BoxDecoration(color: colorScheme.surface, borderRadius: 8.circleBorderRadius);

  BoxDecoration get fieldFocusBackground => BoxDecoration(
      color: colorScheme.surface,
      borderRadius: 8.circleBorderRadius,
      border: Border.all(color: colorScheme.inversePrimary));

  BoxDecoration get fieldErrorBackground => BoxDecoration(
      color: colorScheme.surface, borderRadius: 8.circleBorderRadius, border: Border.all(color: colorScheme.error));

  /// TextField
  InputDecorationTheme get flatTextField => InputDecorationTheme(
        isDense: true,
        errorStyle: TextStyle(height: 0, fontSize: 0),
        fillColor: Colors.transparent,
        filled: false,
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.inversePrimary, width: 1.5)),
        disabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.secondary, width: 1.5)),
        errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.errorContainer, width: 1.5)),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: colorScheme.inversePrimary, width: 1.5)),
        hintStyle: textTheme.bodyMedium?.apply(color: colorScheme.outline),
      );
}
