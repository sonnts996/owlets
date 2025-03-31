/*
 Created by Thanh Son on 22/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared.dart';

class IconTextTile extends StatelessWidget {
  const IconTextTile({
    required this.child, super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.padding,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, 8.horizontalSpacing],
            Expanded(child: child),
            if (suffixIcon != null) ...[8.horizontalSpacing, suffixIcon!],
          ],
        ),
      );
}

class SelectableIconTextTile extends StatelessWidget {
  const SelectableIconTextTile({
    required this.label, super.key,
    this.icon,
    this.selected = false,
    this.onTab,
    this.padding,
  });

  final String label;
  final Widget? icon;
  final bool selected;
  final ValueChanged<bool>? onTab;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTab?.let((it) => () => it(selected)),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, 8.horizontalSpacing],
              Expanded(child: AppDisplay(label)),
              if (onTab != null) ...[
                8.horizontalSpacing,
                AppCheckBox(value: selected, onTab: onTab!),
                16.horizontalSpacing
              ]
            ],
          ),
        ),
      );
}
