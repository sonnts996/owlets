/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';

import '../../../application/app.dart';
import '../../theme/app_theme.dart';
import '../../theme/custom_decoration.dart';
import '../../theme/money_theme.dart';

extension ContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get scheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  MoneyTheme get transactionTheme => theme.extension<MoneyTheme>()!;

  Color get bodyColor => OwletApp.appTheme.appSchemes.bodyColor;

  Color get displayColor => OwletApp.appTheme.appSchemes.displayColor;

  CustomDecoration get decoration => theme.extension<CustomDecoration>()!;
}
