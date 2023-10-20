/*
 Created by Thanh Son on 06/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';

import '../shared.dart';


class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions = const [],
    this.bottom,
    this.flexibleSpace,
  });

  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final PreferredSize? bottom;
  final Widget? flexibleSpace;

  @override
  Widget build(BuildContext context) => AppBar(
        title: AppBarTitle(title, textColor: context.theme.appBarTheme.foregroundColor),
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        centerTitle: true,
        actions: actions,
        bottom: bottom,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(decoration: BoxDecoration(gradient: context.decoration.primaryGradient)),
            ),
            if (flexibleSpace != null) flexibleSpace!
          ],
        ),
        leading: Navigator.canPop(context)
            ? (leading ??
                BackIcon(
                  onBackPressed: () {
                    Navigator.maybePop(context);
                  },
                ))
            : null,
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class BaseTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseTitleAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions = const [],
    this.bottom,
    this.flexibleSpace,
  });

  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final PreferredSize? bottom;
  final Widget? flexibleSpace;

  @override
  Widget build(BuildContext context) => AppBar(
        title: AppBarTitle(title, textColor: context.theme.appBarTheme.foregroundColor),
        centerTitle: true,
        actions: actions,
        bottom: bottom,
        flexibleSpace: flexibleSpace,
        leading: Navigator.canPop(context)
            ? (leading ??
                BackIcon(
                  onBackPressed: () {
                    Navigator.maybePop(context);
                  },
                ))
            : null,
      );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
