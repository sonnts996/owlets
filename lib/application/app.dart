/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rowlet/rowlet.dart';

import '../base/base.dart';
import '../base/theme/app_theme.dart';
import '../gen/l10n/app_localizations.dart';
import 'app_routes.dart';
import 'owlet_app_global_provider.dart';

class OwletApp extends StatefulWidget {
  const OwletApp();

  @override
  State<StatefulWidget> createState() => _OwletAppState();
}

class _OwletAppState extends State<OwletApp> {
  final AppTheme appTheme = AppTheme();
  final NavigationService<AppRoute> navigatorService = NavigationService<AppRoute>(
    navigationKey: GlobalKey(),
    routeObservers: [],
    trailingSlash: true,
    routeBase: AppRoute('/'),
  );

  @override
  void initState() {
    configureDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => OwletAppGlobal(
        child: ScreenUtilInit(
          child: ListenableBuilder(
            listenable: appTheme,
            builder: (context, child) => MaterialApp.router(
              routerConfig: navigatorService.routerConfig,
              theme: appTheme.light,
              darkTheme: appTheme.dark,
              themeMode: appTheme.themeMode,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            ),
          ),
        ),
        service: navigatorService,
        routes: navigatorService.routeBase!,
        appTheme: appTheme,
      );
}
