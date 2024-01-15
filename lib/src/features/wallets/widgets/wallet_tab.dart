/*
 Created by Thanh Son on 27/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../components/money_text.dart';
import '../domain/enum/wallet_index.dart';
import 'wallet_card.dart';
import 'wallet_index_icon.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({
    required this.obscuredNotifier,
    required this.onTab,
    super.key,
  });

  final MoneyObscured obscuredNotifier;
  final ValueChanged<String> onTab;

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        separatorBuilder: (context, index) => const SizedBox(height: 0),
        itemCount: 11,
        itemBuilder: (context, index) {
          if (index == 10) {
            return SafeArea(
              top: false,
              child: Container(alignment: Alignment.center, height: 48, child: const Text('End Of List')),
            );
          }
          return WalletCard(
            walletName: 'Tiền mặt',
            amount: 1000.0 * index,
            walletColor: Colors.red.rotate(12 * index),
            indexIcon: WalletIndexIcon(indexType: index.isEven ? WalletIndexType.income : WalletIndexType.expense),
            currency: 'VND',
            obscuredNotifier: obscuredNotifier,
            onTab: () => onTab('wallet:id'),
          );
        },
      );
}
