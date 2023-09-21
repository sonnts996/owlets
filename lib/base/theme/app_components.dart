/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

import 'components/app_animations.dart';
import 'components/app_decorations.dart';

part 'app_components.tailor.dart';

@TailorMixin(themeGetter: ThemeGetter.none)
class AppComponents extends ThemeExtension<AppComponents> with _$AppComponentsTailorMixin {
  const AppComponents({required this.animations, required this.decoration});

  @override
  final AppAnimations animations;
  @override
  final AppDecoration decoration;
}
