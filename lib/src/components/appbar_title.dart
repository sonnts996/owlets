/*
 Created by Thanh Son on 20/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';

import 'ext/contextx.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle(this.title, {super.key, this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.titleMedium;
    return Transform.translate(
      offset: const Offset(0, 1),
      child: Text(
        title.toUpperCase(),
        style: titleStyle?.apply(color: color, fontWeightDelta: 2),
      ),
    );
  }
}
