/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:owlet_router/router.dart';

import 'create/presentations/create_wallet_page.dart';
import 'detail/presentations/wallet_detail_page.dart';
import 'manager/presentations/wallet_manager_page.dart';

class WalletRoute extends RouteBase {
  WalletRoute(super.segment);

  final manager = MaterialRouteBuilder(
    '/manager',
    pageBuilder: (context, settings) => const WalletManagerPage(),
  );

  final detail = MaterialRouteBuilder<String, void>(
    '/detail',
    pageBuilder: (context, settings) => WalletDetailPage(id: settings.arguments! as String),
  );

  final create = MaterialRouteBuilder(
    '/create',
    pageBuilder: (context, settings) => const CreateWalletPage(),
  );

  @override
  List<RouteMixin> get children => [manager, detail, create];
}
