/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:rowlet/rowlet.dart';

import '../presentations/home_page.dart';

class HomeRoute extends MaterialBuilder {
  HomeRoute(super.path)
      : super(
          materialBuilder: (context, settings) => HomePage(),
        );

  @override
  List<RouteBase> get routes => [];
}
