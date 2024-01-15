/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import 'ext/contextx.dart';

class AppTooltip extends StatelessWidget {
  const AppTooltip({
    required this.controller,
    required this.child,
    required this.content,
    super.key,
  });

  factory AppTooltip.content(String text, {required Widget child, required JustTheController controller}) => AppTooltip(
        controller: controller,
        content: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(text, style: context.theme.textTheme.labelLarge?.apply(color: context.scheme.onInverseSurface)),
          ),
        ),
        child: child,
      );

  final JustTheController controller;
  final Widget child;
  final Widget content;

  static const _tailHeight = 10.0;
  static const _tailWidth = 20.0;

  Offset getPointOnLine(Offset p1, Offset p2, double a) {
    final direction = p2 - p1;
    final directionLength = direction.distance;
    if (directionLength == 0) {
      return p1;
    }
    final offset = a / directionLength;
    return p1 + (direction * offset);
  }

  Path drawTail(Offset tip, Offset point2, Offset point3) {
    final point12 = getPointOnLine(tip, point2, _tailHeight / 2);
    final point13 = getPointOnLine(tip, point3, _tailHeight / 2);
    final path = Path();
    path.moveTo(point2.dx, point2.dy);
    path.lineTo(point3.dx, point3.dy);

    path.lineTo(point13.dx, point13.dy);
    path.quadraticBezierTo(tip.dx, tip.dy, point12.dx, point12.dy);
    path.lineTo(point2.dx, point2.dy);

    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) => JustTheTooltip(
        controller: controller,
        preferredDirection: AxisDirection.up,
        tailLength: _tailHeight,
        tailBaseWidth: _tailWidth,
        tailBuilder: drawTail,
        elevation: 5,
        showDuration: const Duration(seconds: 5),
        backgroundColor: context.theme.colorScheme.inverseSurface,
        content: content,
        child: child,
      );
}
