/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_manager/overlay_manager.dart';
import 'package:owlet_router/router.dart';

import '../gen/l10n/app_localizations.dart';
import 'app_route.dart';
import 'app_theme.dart';

class OwletApp extends StatelessWidget {
  const OwletApp({super.key});

  static final NavigationService<AppRoute> service = NavigationService(route: AppRoute());
  static final AppTheme appTheme = AppTheme();
  static final OverlayManager overlayManager = GlobalOverlayManager(navigatorKey: service.navigationKey);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        child: ListenableBuilder(
          listenable: appTheme,
          builder: (context, child) => MaterialApp.router(
            routerConfig: service.routerConfig,
            theme: appTheme.light,
            darkTheme: appTheme.dark,
            themeMode: appTheme.themeMode,
            locale: const Locale('vi'),
            localizationsDelegates: OwletS.localizationsDelegates,
            supportedLocales: OwletS.supportedLocales,
          ),
        ),
      );
}
