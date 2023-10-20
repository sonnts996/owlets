/*
 Created by Thanh Son on 19/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectx/objectx.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../../base/shared.dart';
import '../../shared.dart';
import '../presentations/bloc/create_wallet_bloc.dart';
import '../presentations/create_wallet_page.dart';
import '../presentations/widgets/wallet_index_selector.dart';

class CreateWalletRoute extends RouteBuilder {
  CreateWalletRoute(super.segmentPath);

  @override
  Route<Object?>? builder(RouteSettings settings) {
    final bloc = getIt.get<CreateWalletBloc>();
    return ModalBottomSheetRoute(
      settings: settings,
      isScrollControlled: true,
      builder: (context) => BlocProvider(
          create: (context) => bloc,
          child: CreateWalletPage(createWalletBloc: bloc),
        ),
    );
  }

  final walletIndexPopup = RouteBuilder<WalletIndexPopupParams, TransactionWalletIndexInterface>(
    '/wallet_index_popup',
    builder: (settings) {
      final params = settings.arguments?.castTo<WalletIndexPopupParams?>();
      if (params == null) {
        return null;
      }
      return ModalBottomSheetRoute(
        settings: settings,
        useSafeArea: true,
        isScrollControlled: false,
        builder: (context) => WalletIndexPopupSelector(
          walletIndexList: params.walletIndexList,
          controller: params.controller,
        ),
      );
    },
  );

  @override
  List<RouteSegment> get children => [walletIndexPopup];
}

class WalletIndexPopupParams {
  const WalletIndexPopupParams({required this.walletIndexList, required this.controller});

  final List<TransactionWalletIndexInterface> walletIndexList;
  final SelectedController<TransactionWalletIndexInterface?> controller;
}
