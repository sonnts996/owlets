/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owlet_router/router.dart';

import '../base/shared.dart';
import '../base/theme/app_theme.dart';
import '../gen/l10n/app_localizations.dart';
import 'app_routes.dart';
import 'owlet_app_global_provider.dart';

class OwletApp extends StatefulWidget {
  const OwletApp({super.key});

  @override
  State<StatefulWidget> createState() => _OwletAppState();
}

class _OwletAppState extends State<OwletApp> {
  final AppTheme appTheme = AppTheme();
  final AppRoute appRoute = AppRoute();
  late final NavigationService<AppRoute> navigatorService = NavigationService<AppRoute>(
    navigationKey: GlobalKey(),
    routeObservers: [],
    initialRoute: '/',
    route: appRoute,
  );

  @override
  void initState() {
    configureDependencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => OwletAppGlobal(
    service: navigatorService,
        routes: navigatorService.route,
        appTheme: appTheme,
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
      );
}
