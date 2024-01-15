/*
 Created by Thanh Son on 20/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ext/contextx.dart';

class AppBackLeading extends StatelessWidget {
  const AppBackLeading({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) => Navigator.canPop(context)
      ? IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: IconTheme(
            data: context.theme.appBarTheme.iconTheme ?? const IconThemeData(size: 28),
            child: Icon(
              CupertinoIcons.back,
              color: color,
            ),
          ),
        )
      : const SizedBox.shrink();
}
