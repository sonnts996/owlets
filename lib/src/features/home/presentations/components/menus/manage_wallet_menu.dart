/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../../base/shared.dart';
import '../../../../../../gen/assets.gen.dart';
import 'base_menu.dart';

class ManageWalletMenu extends StatelessWidget {
  const ManageWalletMenu({super.key, this.onTab});

  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) => BaseItemMenu(
      crossAxisCellCount: 3,
      mainAxisCellCount: 2,
      onTab: onTab,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.image.icons.ic3dWalletManager.image(
            height: 64,
            width: 64,
          ),
          8.0.horizontalSpacing,
          AppDisplay('Your Wallets', textColor: context.scheme.onBackground)
        ],
      ));
}
