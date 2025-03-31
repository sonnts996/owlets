/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:objectx/objectx.dart';

import '../../../../../../base/shared.dart';

class AppTableCell extends StatelessWidget {
  const AppTableCell({
    required this.child,
    super.key,
    this.background,
    this.alignment = Alignment.centerLeft,
    this.sideColor,
  });

  final Color? background;
  final Widget child;
  final Alignment alignment;
  final Color? sideColor;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
            color: background ?? context.scheme.surface,
            border: sideColor?.let((it) => Border(right: BorderSide(color: it, width: 6, style: BorderStyle.solid)))),
        alignment: alignment,
        child: child,
      );
}

class AppTableTitleCell extends StatelessWidget {
  const AppTableTitleCell(this.text, {super.key, this.background, this.alignment = Alignment.center});

  final Color? background;
  final String text;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final finalBg = background ?? context.theme.primaryColor;
    return AppTableCell(
      background: finalBg,
      alignment: alignment,
      child: AppFormLabel(text, textColor: finalBg.textColor),
    );
  }
}
