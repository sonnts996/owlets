/*
 Created by Thanh Son on 19/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../../base/shared.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../shared.dart';

class WalletIndexPopupSelector extends StatelessWidget {
  const WalletIndexPopupSelector({
    super.key,
    required this.walletIndexList,
    required this.controller,
  });

  final List<TransactionWalletIndexInterface> walletIndexList;
  final SelectedController<TransactionWalletIndexInterface?> controller;

  @override
  Widget build(BuildContext context) => AppBottomSheet(
    background: context.scheme.surface,
    child: AppListItemSheet(
        itemCount: walletIndexList.length,
        padding: 8.topLeftInsets,
        itemBuilder: (context, index) {
          final item = walletIndexList[index];
          return AppSelectable(
            controller: controller,
            value: item,
            builder: (isSelected) => SelectableIconTextTile(
                label: item.name,
                selected: isSelected,
                icon: BoxIcon(
                  child: AssetGenImage(item.iconUrl).image(),
                  size: 32,
                  inset: 2,
                  backgroundColor: context.scheme.surface,
                ),
                onTab: (value) {
                  Navigator.pop(context, item);
                }),
          );
        }),
  );
}
