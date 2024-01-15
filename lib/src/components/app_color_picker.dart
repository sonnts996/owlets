/*
 Created by Thanh Son on 10/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owlet_flutter/owlets.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({
    required this.controller,
    super.key,
  });

  final ValueNotifier<Color> controller;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<Color>(
        valueListenable: controller,
        builder: (context, value, child) => Wrap(
          spacing: 4,
          runSpacing: 8,
          children: List.generate(
            16,
            (index) {
              final c = const Color(0xFFeb5555).rotate(index * 22);
              final size = ((1.sw - 60) / 8).clamp(40, 56).toDouble();
              return ColorItem(
                controller: controller,
                color: c,
                selectedColor: value,
                size: size,
              );
            },
          ),
        ),
      );
}

class ColorItem extends StatelessWidget {
  const ColorItem({
    required this.controller,
    required this.color,
    required this.selectedColor,
    this.size = 48,
    super.key,
  });

  final ValueNotifier<Color> controller;
  final Color color;
  final Color selectedColor;
  final double size;

  @override
  Widget build(BuildContext context) => IconTheme(
        data: const IconThemeData(size: 32, color: Colors.white),
        child: GestureDetector(
          onTap: () {
            controller.value = color;
          },
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
            alignment: Alignment.center,
            child: color.value == selectedColor.value ? const Icon(FeatherIcons.check) : const SizedBox.shrink(),
          ),
        ),
      );
}
