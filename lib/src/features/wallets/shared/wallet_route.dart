/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../base/shared.dart';
import '../create/shared.dart';
import '../manager/presentations/bloc/wallet_manager_bloc.dart';
import '../manager/presentations/wallet_manager_page.dart';

class WalletRoute extends MaterialRouteBuilder {
  WalletRoute(super.segmentPath);

  @override
  PageBuilder? get pageBuilder => (context, settings) => Container();

  final create =  CreateWalletRoute('/create');

  final manager = MaterialRouteBuilder(
    '/manager',
    pageBuilder: (context, settings) {
      final bloc = getIt.get<WalletManagerBloc>();
      return BlocProvider(
        create: (context) => bloc,
        child: WalletManagerPage(managerBloc: bloc),
      );
    },
  );

  @override
  List<RouteSegment> get children => [create, manager];
}
