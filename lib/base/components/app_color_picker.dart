/*
 Created by Thanh Son on 20/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import 'app_controller.dart';
import 'form/app_forms.dart';

class AppColorPicker extends StatefulWidget {
  const AppColorPicker({
    super.key,
    this.label = 'Color Picker',
    this.getter,
    this.initialColor,
    this.controller,
  }) : assert(!(initialColor == null && controller == null), 'Must have a special color when init');

  final String label;
  final Color? initialColor;
  final InternalValueGetter<Color>? getter;
  final SelectedController<Color>? controller;

  @override
  State<AppColorPicker> createState() => _AppColorPickerState();
}

class _AppColorPickerState extends State<AppColorPicker> {
  late SelectedController<Color> controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? SelectedController(widget.initialColor!);
    widget.getter?.closure = () => controller.value;
  }

  @override
  void didUpdateWidget(covariant AppColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller && widget.controller != null) {
      controller = widget.controller!;
    }
    if (oldWidget.getter != widget.getter) {
      widget.getter?.closure = () => controller.value;
    }
  }

  @override
  Widget build(BuildContext context) => AppDecorationForm(
        label: widget.label,
        child: ColorPicker(
          color: controller.value,
          onColorChanged: (color) {
            controller.value = color;
          },
          width: 32,
          height: 32,
          borderRadius: 12,
          subheading: Text(
            'Select color shade',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          padding: 8.verticalInsets,
          pickersEnabled: const <ColorPickerType, bool>{
            ColorPickerType.both: true,
            ColorPickerType.primary: false,
            ColorPickerType.accent: false,
            ColorPickerType.bw: false,
            ColorPickerType.custom: false,
            ColorPickerType.wheel: false,
          },
        ),
      );
}
