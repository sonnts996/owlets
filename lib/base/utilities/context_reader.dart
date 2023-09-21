/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../application/owlet_app_global_provider.dart';
import '../../gen/l10n/app_localizations.dart';
import '../theme/app_components.dart';
import '../theme/app_theme.dart';

extension ContextReader on BuildContext{
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  AppTheme get appTheme => OwletAppGlobal.of(this).appTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get scheme => theme.colorScheme;

  AppComponents get components => appTheme.component;
}