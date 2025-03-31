/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:owlet_flutter/owlets.dart';
import 'package:owlet_router/router.dart';

import '../src/features/home/shared.dart';
import '../src/features/transactions/shared.dart';
import '../src/features/wallets/shared.dart';

class AppRoute extends RouteBase {
  AppRoute():super.root();

  final home = HomeRoute('/');

  final transactions = TransactionRoute('/transactions');

  final wallet = WalletRoute('/wallet');

  final schemeTest = MaterialRouteBuilder(
    '/schemeTest',
    pageBuilder: (context, settings) => const SchemePalette(),
  );

  @override
  List<RouteMixin> get children => [
        home,
        transactions,
        wallet,
        schemeTest,
      ];
}
