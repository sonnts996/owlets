/*
 Created by Thanh Son on 22/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import '../../../components/money_text.dart';
import 'reporter_pane.dart';

class WalletHeader extends StatelessWidget {
  const WalletHeader({
    required this.obscuredNotifier,
    super.key,
  });

  final MoneyObscured obscuredNotifier;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextField(
              decoration: InputDecoration(hintText: 'Tìm kiếm ví...', prefixIcon: Icon(FeatherIcons.search)),
            ),
          ),
          ReporterPane(obscuredNotifier: obscuredNotifier),
        ],
      );
}
