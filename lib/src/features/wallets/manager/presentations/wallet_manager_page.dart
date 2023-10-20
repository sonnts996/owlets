/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/shared.dart';
import 'bloc/wallet_manager_bloc.dart';

class WalletManagerPage extends StatefulWidget {
  const WalletManagerPage({super.key, required this.managerBloc});

  final WalletManagerBloc managerBloc;

  @override
  State<WalletManagerPage> createState() => _WalletManagerPageState();
}

class _WalletManagerPageState extends State<WalletManagerPage> {
  @override
  void initState() {
    super.initState();
    widget.managerBloc.add(GetWalletListEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: BaseTitleAppBar(title: 'Wallet Manager'),
        floatingActionButton: CustomPrimaryButton(
          height: 64,
          width: 64,
          child: AddFloatingBarIcon(),
        ),
        body: BlocBuilder<WalletManagerBloc, WalletManagerState>(
          buildWhen: (previous, current) => current is WalletLoadSuccessState,
          builder: (context, state) {
            if (state is WalletLoadSuccessState) {
              return ListView.builder(
                itemCount: state.wallets.length,
                itemBuilder: (context, index) => Text(state.wallets[index].name),
              );
            }
            return SizedBox.shrink();
          },
        ),
      );
}
