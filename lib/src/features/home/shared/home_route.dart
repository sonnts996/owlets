/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:rowlet/rowlet.dart';

import '../presentations/home_page.dart';

class HomeRoute extends MaterialRouteBuilder {
  HomeRoute(super.segmentPath)
      : super(
          pageBuilder: (context, settings) => HomePage(),
        );

  @override
  List<RouteSegment> get children => [];
}
