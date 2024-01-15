/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../application/app_theme.dart';
import '../../base/theme.dart';
import 'custom_decoration.dart';
import 'money_theme.dart';

part 'app_theme_dark.dart';

part 'app_theme_light.dart';

extension AppThemeX on AppTheme {
  AppSchemes get appSchemes => themeBuilder.appSchemes;
}
