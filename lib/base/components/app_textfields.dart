/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:owlet_flutter/owlets.dart';

import '../shared.dart';

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

class AppFlatTextField extends StatelessWidget {
  const AppFlatTextField({
    super.key,
    this.hint,
    this.formValidator,
    this.initialValue,
    this.controller,
    this.label,
    this.textFactor = 1,
    this.maxLines = 1,
    this.minLines = 1,
    this.valueGetter,
    this.errorText,
  });

  final String? hint;
  final String? label;
  final String? Function(String? value)? formValidator;
  final String? initialValue;
  final TextEditingController? controller;
  final double textFactor;
  final InternalValueGetter<String>? valueGetter;
  final int maxLines;
  final int minLines;
  final String? errorText;

  @override
  Widget build(BuildContext context) => AppTextField(
        errorText: errorText,
        label: label,
        valueGetter: valueGetter,
        controller: controller,
        formValidator: formValidator,
        hint: hint,
        initialValue: initialValue,
        maxLines: maxLines,
        minLines: minLines,
        textStyle: context.theme.textTheme.bodyLarge
            ?.apply(color: context.theme.colorScheme.onSurfaceVariant, fontSizeFactor: textFactor),
        inputDecorationTheme: context.decoration.flatTextField,
      );
}

class AppChipTextField extends StatefulWidget {
  const AppChipTextField({
    super.key,
    this.hint,
    this.initialValues = const {},
    this.label,
    this.valueGetter,
  });

  final String? hint;
  final String? label;
  final Set<String> initialValues;
  final InternalValueGetter<Set<String>>? valueGetter;

  @override
  State<AppChipTextField> createState() => _AppChipTextFieldState();
}

class _AppChipTextFieldState extends State<AppChipTextField> {
  late final Set<String> values;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(debugLabel: 'AppChipTextField');

  @override
  void initState() {
    super.initState();
    values = Set.from(widget.initialValues);
    widget.valueGetter?.closure = () => values;
  }

  @override
  void dispose() {
    widget.valueGetter?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _focusNode.requestFocus,
        child: AppDecorationForm(
          label: widget.label,
          focusNode: _focusNode,
          child: Wrap(
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runSpacing: 4,
              spacing: 4,
              children: [
                ...values.map((e) => Chip(
                      deleteIcon: FieldIcon(CupertinoIcons.clear_thick),
                      label: Text(e),
                      onDeleted: () {
                        setState(() {
                          values.remove(e);
                        });
                      },
                      // backgroundColor: context.scheme.surface,
                      // labelStyle: context.theme.textTheme.labelSmall,
                    )),
                AutoSizeTextField(
                    controller: _controller,
                    fullwidth: false,
                    focusNode: _focusNode,
                    style: context.theme.textTheme.bodyMedium,
                    onChanged: (value) {
                      if (value.contains(',')) {
                        setState(() {
                          _controller.text = '';
                          final list = value.split(',');
                          setState(() {
                            values
                              ..addAll(list)
                              ..removeWhere((element) => element.isEmpty);
                          });
                        });
                      }
                    },
                    onSubmitted: (value) {
                      final list = value.split(',');
                      setState(() {
                        _controller.text = '';
                        values
                          ..addAll(list)
                          ..removeWhere((element) => element.isEmpty);
                      });
                    },
                    minWidth: 100,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: context.theme.textTheme.bodyMedium?.apply(color: context.scheme.outline),
                      filled: false,
                      isDense: true,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    )),
              ]),
        ),
      );
}
