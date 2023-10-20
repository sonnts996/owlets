/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../application/owlet_app_global_provider.dart';
import '../shared.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    super.key,
    this.onTab,
    required this.child,
    this.semanticLabel = 'custom-primary-button',
    this.height = 50,
    this.width = double.infinity,
  });

  final Widget child;
  final VoidCallback? onTab;
  final String semanticLabel;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => Semantics(
        label: semanticLabel,
        onTap: onTab,
        child: InkWell(
          onTap: onTab,
          borderRadius: 100.circleBorderRadius,
          child: Ink(
            height: height,
            width: width,
            decoration: context.decoration.primaryButton,
            child: child,
          ),
        ),
      );
}

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    this.text = '',
    this.margin = EdgeInsets.zero,
    this.onTab,
  });

  final String text;
  final EdgeInsets margin;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: SizedBox(
          height: 50,
          child: CustomPrimaryButton(
            onTab: onTab,
            child: Center(
                child: AppDisplay(
              text,
              textColor: context.scheme.onPrimary,
            )),
          ),
        ),
      );
}

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    super.key,
    required this.onTab,
    required this.value,
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
        child: CustomPaint(size: Size.square(20), painter: CircleCheckIcon(isChecked: widget.value)),
      );
}

class CircleCheckIcon extends CustomPainter {
  CircleCheckIcon({super.repaint, required this.isChecked});

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

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.text = '',
    this.margin = EdgeInsets.zero,
    this.onTab,
    this.semanticLabel,
  });

  final String text;
  final EdgeInsets margin;
  final VoidCallback? onTab;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: Semantics(
          label: semanticLabel ?? 'app-text-button',
          onTap: onTab,
          child: InkWell(
            onTap: onTab,
            borderRadius: 100.circleBorderRadius,
            splashColor: context.scheme.background,
            child: Ink(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              color: Colors.transparent,
              child: Center(child: AppActionDisplay(text, textColor: context.scheme.primary)),
            ),
          ),
        ),
      );
}
