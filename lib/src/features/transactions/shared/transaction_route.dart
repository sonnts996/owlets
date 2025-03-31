/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:owlet_router/router.dart';

import '../create/presentations/create_transaction_page.dart';

class TransactionRoute extends RouteBase {
  TransactionRoute(super.segmentPath);

  final create = MaterialRouteBuilder(
    '/create',
    pageBuilder: (context, settings) => const CreateTransactionPage(),
  );

  @override
  List<RouteMixin> get children => [create];
}
