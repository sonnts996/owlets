/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:rowlet/rowlet.dart';

import '../base/shared.dart';
import '../base/theme/app_theme.dart';
import 'app_routes.dart';

class OwletAppGlobal extends InheritedWidget {
  OwletAppGlobal({
    required super.child,
    required this.service,
    required this.routes,
    required this.appTheme,
  }) {
    getIt
      ..registerFactoryIfNotExist(() => service, instanceName: 'OwletAppGlobal')
      ..registerFactoryIfNotExist(() => routes,instanceName: 'OwletAppGlobal')
      ..registerFactoryIfNotExist(() => appTheme,instanceName: 'OwletAppGlobal');
  }

  final ROwletNavigationService<AppRoute> service;
  final AppRoute routes;
  final AppTheme appTheme;

  static AppTheme get themeInst => getIt.get(instanceName: 'OwletAppGlobal');

  static AppRoute get routesInst => getIt.get(instanceName: 'OwletAppGlobal');

  static ROwletNavigationService<AppRoute> get serviceInst => getIt.get(instanceName: 'OwletAppGlobal');

  static OwletAppGlobal? maybeOf(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

  static OwletAppGlobal of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No OwletAppGlobal found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant OwletAppGlobal oldWidget) => oldWidget.appTheme != appTheme;
}
