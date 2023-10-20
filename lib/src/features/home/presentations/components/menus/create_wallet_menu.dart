/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';

import '../../../../../../gen/assets.gen.dart';
import 'base_menu.dart';

class CreateWalletMenu extends StatelessWidget {
  const CreateWalletMenu({super.key, this.onTab});

  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) => BaseItemMenu(
      onTab: onTab,
      child: Assets.image.icons.ic3dAddWallet.image(
        height: 42,
        width: 42,
      ));
}
