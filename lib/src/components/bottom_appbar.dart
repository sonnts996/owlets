/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ext/contextx.dart';

class BottomAppbarItem extends StatelessWidget {
  const BottomAppbarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTab,
    super.key,
  });

  final Widget icon;
  final String label;
  final bool selected;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) => ColorFiltered(
        colorFilter: ColorFilter.mode(
          selected
              ? context.theme.bottomNavigationBarTheme.selectedItemColor!
              : context.theme.bottomNavigationBarTheme.unselectedItemColor!,
          BlendMode.srcIn,
        ),
        child: GestureDetector(
          onTap: onTab,
          behavior: HitTestBehavior.opaque,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.square(
                dimension: selected
                    ? context.theme.bottomNavigationBarTheme.selectedIconTheme?.size
                    : context.theme.bottomNavigationBarTheme.unselectedIconTheme?.size,
                child: icon,
              ),
              4.verticalSpace,
              Text(
                label,
                style: selected
                    ? context.theme.bottomNavigationBarTheme.selectedLabelStyle
                    : context.theme.bottomNavigationBarTheme.unselectedLabelStyle,
              ),
            ],
          ),
        ),
      );
}
