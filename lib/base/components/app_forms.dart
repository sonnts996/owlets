/*
 Created by Thanh Son on 30/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../shared.dart';

class AppForm extends StatelessWidget {
  const AppForm({
    super.key,
    required this.child,
    this.label,
    this.errorText,
  });

  final Widget child;
  final String? label;
  final String? errorText;

  bool get isError => errorText != null;

  @override
  Widget build(BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null)
              Padding(
                padding: 4.bottomLeftInsets,
                child: AppFormLabel(label!),
              ),
            child,
            if (isError) ErrorTextTile(errorText: errorText!, verticalPadding: 4.allInsets),
          ]);
}

class AppDecorationForm extends StatefulWidget {
  const AppDecorationForm({
    super.key,
    required this.child,
    this.label,
    this.errorText,
    this.isError,
    this.padding,
    this.focusNode,
  });

  final Widget child;
  final String? label;
  final String? errorText;
  final bool? isError;
  final EdgeInsets? padding;
  final FocusNode? focusNode;

  @override
  State<AppDecorationForm> createState() => _AppDecorationFormState();
}

class _AppDecorationFormState extends State<AppDecorationForm> {
  bool get _isError => widget.isError ?? widget.errorText != null;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocus);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode?.removeListener(_onFocus);
  }

  void _onFocus() {
    setState(() {});
  }

  BoxDecoration _decoration(
      {required BoxDecoration errorDecoration,
      required BoxDecoration normalDecoration,
      required BoxDecoration focusDecoration}) {
    if (_isError) {
      return errorDecoration;
    } else if (widget.focusNode?.hasFocus == true) {
      return focusDecoration;
    }
    return normalDecoration;
  }

  @override
  Widget build(BuildContext context) => AppForm(
        label: widget.label,
        errorText: widget.errorText,
        child: Container(
            width: double.infinity,
            decoration: _decoration(
              errorDecoration: context.decoration.fieldErrorBackground,
              focusDecoration: context.decoration.fieldFocusBackground,
              normalDecoration: context.decoration.fieldBackground,
            ),
            padding: widget.padding ?? context.decoration.normalFieldInset,
            child: widget.child),
      );
}
