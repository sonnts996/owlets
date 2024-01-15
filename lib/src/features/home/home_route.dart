/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:owlet_router/router.dart';

import 'presentations/home_page.dart';

class HomeRoute extends RouteBase {
  HomeRoute(super.segment);

  final _page = MaterialRouteBuilder('/', pageBuilder: (context, settings) => const HomePage());

  @override
  List<RouteMixin> get children => [_page];
}
