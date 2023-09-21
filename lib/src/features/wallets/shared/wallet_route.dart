/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../base/base.dart';
import '../create/presentations/bloc/create_wallet_bloc.dart';
import '../create/presentations/create_wallet_page.dart';
import '../manager/presentations/wallet_manager_page.dart';

@immutable
class WalletRoute extends RouteBase {
  WalletRoute(super.path);

  final create = MaterialBuilder(
    '/create',
    materialBuilder: (context, settings) => BlocProvider(
      create: (context) => getIt.get<CreateWalletBloc>(),
      child: CreateWalletPage(),
    ),
  );

  final manager = MaterialBuilder(
    '/manager',
    materialBuilder: (context, settings) => WalletManagerPage(),
  );

  @override
  List<RouteBase> get routes => [create, manager];
}
