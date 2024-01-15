/*
 Created by Thanh Son on 21/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'money_theme.tailor.dart';

@tailorMixinComponent
class MoneyTheme extends ThemeExtension<MoneyTheme> with _$MoneyThemeTailorMixin {
  MoneyTheme({
    required this.addColor,
    required this.removeColor,
    required this.negativeColor,
    required this.positiveColor,
    required this.largeStyle,
    required this.mediumStyle,
    required this.smallStyle,
    required this.otherColor,
    required this.largeIconSize,
    required this.mediumIconSize,
    required this.smallIconSize,
  });

  @override
  final Color addColor;

  @override
  final Color removeColor;

  @override
  final Color negativeColor;

  @override
  final Color positiveColor;

  @override
  final Color otherColor;

  @override
  final TextStyle largeStyle;

  @override
  final TextStyle mediumStyle;

  @override
  final TextStyle smallStyle;

  @override
  final double largeIconSize;

  @override
  final double mediumIconSize;

  @override
  final double smallIconSize;
}
