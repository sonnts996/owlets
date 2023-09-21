/*
 Created by Thanh Son on 06/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base.dart';
import 'app_text.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
    required this.onBackPressed,
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
        centerTitle: true,
        actions: actions,
        bottom: bottom,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(decoration: BoxDecoration(gradient: context.components.decoration.primaryGradient)),
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
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
