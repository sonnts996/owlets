/*
 Created by Thanh Son on 23/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/widgets.dart';

extension ColorX on Color {
  Color get textColor => isLight ? Color(0xFF424242) : Color(0xFFFFFFFF);

  bool get isLight => computeLuminance() > 0.5;

  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
