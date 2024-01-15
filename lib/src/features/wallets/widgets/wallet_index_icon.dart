/*
 Created by Thanh Son on 05/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';

import '../../../components/ext/contextx.dart';
import '../domain/enum/wallet_index.dart';

class WalletIndexIcon extends StatelessWidget {
  const WalletIndexIcon({
    required this.indexType,
    super.key,
  });

  final WalletIndexType indexType;

  @override
  Widget build(BuildContext context) => IconTheme(data: const IconThemeData(size: 24), child: buildIcon(context));

  Widget buildIcon(BuildContext context) {
    switch (indexType) {
      case WalletIndexType.income:
        return Icon(
          FeatherIcons.download,
          color: context.transactionTheme.addColor,
        );
      case WalletIndexType.expense:
        return Icon(FeatherIcons.share, color: context.transactionTheme.removeColor);
      case WalletIndexType.none:
        return Icon(FeatherIcons.download, color: context.transactionTheme.otherColor);
    }
  }
}
