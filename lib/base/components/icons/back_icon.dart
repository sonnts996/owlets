/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/shared.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    required this.onBackPressed, super.key,
  });

  final VoidCallback onBackPressed;

  @override
  Widget build(BuildContext context) => Semantics(
        label: 'back-icon',
        onTap: onBackPressed,
        child: IconButton(
          onPressed: onBackPressed,
          icon: Icon(
            CupertinoIcons.back,
            size: context.theme.appBarTheme.actionsIconTheme?.size,
            color: context.theme.appBarTheme.foregroundColor,
          ),
        ),
      );
}
