/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:owlet_router/router.dart';

import '../src/features/foundation/foundation_route.dart';
import '../src/features/home/home_route.dart';
import '../src/features/wallets/wallet_route.dart';

class AppRoute extends RouteBase {
  AppRoute() : super.root();

  final foundation = FoundationRoute('/');
  final home = HomeRoute('/home');
  final wallet = WalletRoute('/wallets');

  @override
  List<RouteMixin> get children => [home, foundation, wallet];
}
