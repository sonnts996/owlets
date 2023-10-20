/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:rowlet/rowlet.dart';

import '../create/presentations/create_transaction_page.dart';

class TransactionRoute extends RouteSegment {
  TransactionRoute(super.segmentPath);

  final create = MaterialRouteBuilder(
    '/create',
    pageBuilder: (context, settings) => CreateTransactionPage(),
  );

  @override
  List<RouteSegment> get children => [create];
}
