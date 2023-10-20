/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:owlet_flutter/owlets.dart';
import 'package:rowlet/rowlet.dart';

import '../src/features/home/shared.dart';
import '../src/features/transactions/shared.dart';
import '../src/features/wallets/shared.dart';

class AppRoute extends OriginRoute {
  AppRoute();

  final home = HomeRoute('/');

  final transactions = TransactionRoute('/transactions');

  final wallet = WalletRoute('/wallet');

  final schemeTest = MaterialRouteBuilder(
    '/schemeTest',
    pageBuilder: (context, settings) => SchemePalette(),
  );

  @override
  List<RouteSegment> get children => [
        home,
        transactions,
        wallet,
        schemeTest,
      ];
}
