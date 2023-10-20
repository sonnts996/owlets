/*
 Created by Thanh Son on 22/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared.dart';

class FieldIcon extends StatelessWidget {
  const FieldIcon(this.icon, {super.key, this.color});

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) => Icon(
        icon,
        size: 20,
        color: color ?? context.scheme.secondary,
      );
}

class BoxIcon extends StatelessWidget {
  const BoxIcon({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.size = 24,
    this.inset = 0,
  });

  final Widget child;
  final Color backgroundColor;
  final double size;
  final double inset;

  @override
  Widget build(BuildContext context) => Container(
      height: size,
      width: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2),
        boxShadow: [
          BoxShadow(
            color: context.scheme.shadow.withOpacity(0.1),
            blurRadius: 6,
            spreadRadius: 1,
            offset: Offset(1, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Padding(
          padding: EdgeInsets.all(inset),
          child: child,
        ),
      ));
}

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

class AddFloatingBarIcon extends StatelessWidget {
  const AddFloatingBarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Icon(
        CupertinoIcons.add,
        color: context.theme.floatingActionButtonTheme.foregroundColor,
        size: context.theme.floatingActionButtonTheme.iconSize,
        semanticLabel: 'add-new',
      );
}
