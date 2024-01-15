/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:overlay_manager/overlay_manager.dart';
import 'package:owlet_router/router.dart';

import '../../../application/app.dart';
import '../../components/ext/contextx.dart';
import 'presentations/splash.dart';
import 'presentations/widgets/loading.dart';

class FoundationRoute extends RouteBase {
  FoundationRoute(super.segment);

  final splash = MaterialRouteBuilder(
    '/',
    pageBuilder: (context, settings) => const SplashPage(),
  );

  final loading = NamedFunctionRouteBuilder(
    '/loading',
    callback: (context, route) {
      OwletApp.overlayManager.show(
        barrierColor: context.scheme.inverseSurface.withOpacity(0.5),
        elevation: 5,
        mode: OverlayMode.opaque,
        builder: (context, entry) => const Loading(),
      );
    },
  );

  @override
  List<RouteMixin> get children => [splash, loading];
}
