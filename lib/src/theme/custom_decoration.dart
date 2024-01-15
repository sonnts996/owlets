/*
 Created by Thanh Son on 13/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'custom_decoration.tailor.dart';

typedef GradientGetter = Gradient Function(Color color);

@tailorMixinComponent
class CustomDecoration extends ThemeExtension<CustomDecoration> with _$CustomDecorationTailorMixin {
  CustomDecoration({
    this.boxShadow = const [],
    this.lightBoxShadow = const [],
  });

  @override
  final List<BoxShadow> boxShadow;

  final List<BoxShadow> lightBoxShadow;

  Gradient colorGradient(Color color) => LinearGradient(
        colors: [color, color.rotate(12)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: const [0, 0.6],
        tileMode: TileMode.clamp,
      );
}
