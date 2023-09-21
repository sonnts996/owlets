/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:rowlet/rowlet.dart';

import '../src/features/home/home.dart';
import '../src/features/splash/splash.dart';
import '../src/features/transactions/transactions.dart';
import '../src/features/wallets/wallets.dart';

@immutable
class AppRoute extends RouteBase {
  AppRoute(super.path);

  final splash = MaterialBuilder(
    '/',
    materialBuilder: (context, settings) => SplashPage(),
  );

  final home = HomeRoute('/home');

  final transactions = TransactionRoute('/transactions');

  final wallet = WalletRoute('/wallet');

  @override
  List<RouteBase> get routes => [
        splash,
        home,
        transactions,
        wallet,
      ];
}
