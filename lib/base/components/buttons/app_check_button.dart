/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'dart:math';

import 'package:flutter/material.dart';

import '../../../application/owlet_app_global_provider.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    required this.onTab,
    required this.value,
    super.key,
  });

  final ValueChanged<bool> onTab;
  final bool value;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.onTab(widget.value),
        child: CustomPaint(size: const Size.square(20), painter: CircleCheckIcon(isChecked: widget.value)),
      );
}

class CircleCheckIcon extends CustomPainter {
  CircleCheckIcon({
    required this.isChecked,
    super.repaint,
  });

  final bool isChecked;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = min(size.width / 2, size.height / 2);
    final offset = Offset(radius, radius);
    late final paint = Paint();
    if (isChecked) {
      paint
        ..shader = OwletAppGlobal.themeInst.component.decoration.higherGradient
            .createShader(Rect.fromCircle(center: offset, radius: radius))
        ..strokeWidth = radius - 2
        ..style = PaintingStyle.stroke;
    } else {
      paint
        ..color = OwletAppGlobal.themeInst.current.colorScheme.outline
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;
    }
    canvas.drawCircle(Offset(radius, radius), radius, paint);
  }

  @override
  bool shouldRepaint(covariant CircleCheckIcon oldDelegate) => oldDelegate.isChecked != isChecked;
}
