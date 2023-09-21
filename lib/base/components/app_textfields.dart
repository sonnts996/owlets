/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:formz/formz.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../base.dart';

class TextFormz extends FormzInput<String, String> {
  TextFormz.dirty(super.value, {this.formValidator}) : super.dirty();

  TextFormz.pure(super.value)
      : this.formValidator = null,
        super.pure();

  final String Function(String? validator)? formValidator;

  @override
  String? validator(String? value) => formValidator?.call(value);
}

class AppFormTextField extends StatefulWidget {
  const AppFormTextField({
    super.key,
    this.hint,
    this.formValidator,
    this.initialValue,
    this.controller,
    this.label,
  });

  final String? hint;
  final String? label;
  final String? Function(String? value)? formValidator;
  final String? initialValue;
  final TextEditingController? controller;

  @override
  State<AppFormTextField> createState() => _AppFormTextFieldState();
}

class _AppFormTextFieldState extends State<AppFormTextField> {
  bool isEdited = false;
  String? _errorText;

  bool get isError => _errorText != null;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.initialValue);
    controller.addListener(_listTextChange);
  }

  @override
  void dispose() {
    controller.removeListener(_listTextChange);
    super.dispose();
  }

  void _listTextChange() {
    setState(() {
      isEdited = true;
    });
  }

  String? _validate(String? value) {
    if (!isEdited) return null;
    return widget.formValidator?.call(value);
  }

  @override
  Widget build(BuildContext context) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            Padding(
              padding: 2.bottomLeftInsets,
              child: AppFormLabel(widget.label!),
            ),
          TextFormField(
              controller: controller,
              validator: (value) =>
                  _validate(value).letOrNull((it) {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      setState(() {
                        _errorText = it;
                      });
                    });

                    return '';
                  }, onNull: () {
                    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                      setState(() {
                        _errorText = null;
                      });
                    });
                    return null;
                  }),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: context.theme.textTheme.bodyMedium?.apply(color: context.theme.colorScheme.onSurfaceVariant),
              decoration: context.components.decoration.primaryTextField.copyWith(hintText: widget.hint)),
              if (isError) Padding(
                padding: 4.allInsets,
                child: AppLabel(_errorText!, textColor: context.theme.colorScheme.error),
              )
        ],
      );
}
