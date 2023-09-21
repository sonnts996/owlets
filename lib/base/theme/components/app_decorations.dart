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

  BoxDecoration get fieldBackground =>
      BoxDecoration(color: colorScheme.surfaceVariant, borderRadius: 8.circleBorderRadius);

  BoxDecoration get fieldErrorBackground => BoxDecoration(
      color: colorScheme.errorContainer,
      borderRadius: 8.circleBorderRadius,
      border: Border.all(color: colorScheme.error));

  InputDecoration get primaryTextField => InputDecoration(
        isDense: true,
        errorStyle: TextStyle(height: 0),
        fillColor: colorScheme.surfaceVariant,
        filled: true,
        enabledBorder: OutlineInputBorder(borderRadius: 8.circleBorderRadius, borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: colorScheme.inversePrimary, width: 1)),
        disabledBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: colorScheme.secondary, width: 1)),
        errorBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: colorScheme.errorContainer, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: 8.circleBorderRadius, borderSide: BorderSide(color: colorScheme.inversePrimary, width: 1)),
        hintStyle: textTheme.bodyMedium?.apply(color: colorScheme.outline),
      );
}
