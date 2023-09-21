/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:rowlet/rowlet.dart';

import '../create/presentations/create_transaction_page.dart';

@immutable
class TransactionRoute extends RouteBase {
  TransactionRoute(super.path);

  final create = MaterialBuilder(
    '/create',
    materialBuilder: (context, settings) => CreateTransactionPage(),
  );

  @override
  List<RouteBase> get routes => [create];
}
