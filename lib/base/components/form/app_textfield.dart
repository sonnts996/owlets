/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../utilities/shared.dart';
import 'app_forms.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.formValidator,
    this.initialValue,
    this.controller,
    this.label,
    this.maxLines = 1,
    this.minLines = 1,
    this.valueGetter,
    this.errorText,
    this.textStyle,
    this.inputDecorationTheme,
  });

  final String? hint;
  final String? label;
  final String? Function(String? value)? formValidator;
  final String? initialValue;
  final TextEditingController? controller;
  final InternalValueGetter<String>? valueGetter;
  final int maxLines;
  final int minLines;
  final String? errorText;
  final TextStyle? textStyle;
  final InputDecorationTheme? inputDecorationTheme;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isEdited = false;
  String? _errorText;

  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    controller.addListener(_listTextChange);
    controller.addListener(_validateFrom);
    widget.valueGetter?.closure = () => controller.text;
    _errorText = widget.errorText;
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.errorText != widget.errorText) {
      _errorText = widget.errorText;
      isEdited = false;
    }
  }

  @override
  void dispose() {
    controller.removeListener(_listTextChange);
    controller.removeListener(_validateFrom);
    widget.valueGetter?.close();
    super.dispose();
  }

  void _listTextChange() {
    setState(() {
      isEdited = true;
    });
  }

  void _validateFrom() {
    final result = _validate(controller.text);
    if (result != _errorText) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        _errorText = result;
        setState(() {});
      });
    }
  }

  String? _validate(String? value) {
    if (!isEdited) return null;
    return widget.formValidator?.call(value);
  }

  @override
  Widget build(BuildContext context) => AppForm(
        errorText: _errorText,
        label: widget.label,
        child: TextFormField(
            controller: controller,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            style: widget.textStyle ?? context.textTheme.bodyMedium?.apply(color: context.scheme.onSurfaceVariant),
            decoration: InputDecoration(hintText: widget.hint, errorText: _errorText).applyDefaults(
              widget.inputDecorationTheme ?? context.theme.inputDecorationTheme,
            )),
      );
}
