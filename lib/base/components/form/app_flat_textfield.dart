/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../utilities/shared.dart';
import 'app_textfield.dart';

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
