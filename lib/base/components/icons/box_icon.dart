/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import '../../utilities/shared.dart';

class BoxIcon extends StatelessWidget {
  const BoxIcon({
    required this.child, super.key,
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
            offset: const Offset(1, 2),
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
