/*
 Created by Thanh Son on 08/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/material.dart';

import 'ext/contextx.dart';

Widget? defaultCounterBuilder(
  BuildContext context, {
  required int currentLength,
  required bool isFocused,
  int? maxLength,
}) =>
    isFocused ? Text('$currentLength/$maxLength') : null;

class TextFieldPrefixIcon extends StatelessWidget {
  const TextFieldPrefixIcon({
    required this.icon,
    super.key,
  });

  final Widget icon;

  @override
  Widget build(BuildContext context) => Transform.translate(
        offset: const Offset(0, 3),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 14, 0),
          child: icon,
        ),
      );
}

class FormLabel extends StatelessWidget {
  const FormLabel(
    this.text, {
    this.padding = const EdgeInsets.fromLTRB(8, 8, 0, 8),
    super.key,
  });

  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Text(
          text.toUpperCase(),
          style: context.textTheme.labelLarge?.apply(fontWeightDelta: 2),
        ),
      );
}

class FocusBuilder extends StatefulWidget {
  const FocusBuilder({required this.builder, this.focusNode, super.key});

  final FocusNode? focusNode;
  final Widget? Function(BuildContext context, FocusNode focusNode) builder;

  @override
  State<FocusBuilder> createState() => _FocusBuilderState();
}

class _FocusBuilderState extends State<FocusBuilder> {
  bool isFocused = false;
  final _focusNode = FocusNode();

  FocusNode get focusNode => widget.focusNode ?? _focusNode;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocused);
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocused);
    super.dispose();
  }

  void onFocused() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, focusNode) ?? const SizedBox.shrink();
}
