/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import '../../base/theme.dart';

@immutable
class AppSchemesLight extends AppSchemes {
  AppSchemesLight()
      : super(
          scheme: ColorScheme.fromSeed(
            brightness: Brightness.light,
            seedColor: const Color(0xFF00d0e0),
            primary: const Color(0xFF00d0e0),
            shadow: Colors.white38,
          ),
          bodyColor: const Color(0xFF424242),
          displayColor: const Color(0xFF666666),
          darkShadow: Colors.black38,
        );
}

@immutable
class AppSchemesDart extends AppSchemes {
  AppSchemesDart()
      : super(
          scheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: const Color(0xFF00d0e0),
            primary: const Color(0xFF00d0e0),
            shadow: Colors.transparent,
          ),
          bodyColor: const Color(0xFFFFFFFF),
          displayColor: const Color(0xFFcccccc),
          darkShadow: Colors.transparent,
        );
}
