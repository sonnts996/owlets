/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';

import '../../utilities/shared.dart';
import '../app_text.dart';
import '../form/form_shared.dart';
import '../icons/icons_shared.dart';

class ComboBoxLabelTile extends StatelessWidget {
  const ComboBoxLabelTile({
    required this.label,
    required this.child,
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.isError = false,
    this.focusNode,
  });

  final String label;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isError;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => AppDecorationForm(
        isError: isError,
        padding: EdgeInsets.zero,
        focusNode: focusNode,
        child: ComboBoxTile(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppFormLabel(label, textColor: foregroundColor),
              child,
            ],
          ),
        ),
      );
}

class ComboBoxTile extends StatelessWidget {
  const ComboBoxTile({
    required this.child,
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.isError = false,
    this.focusNode,
  });

  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;
  final bool isError;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) => AppDecorationForm(
        isError: isError,
        focusNode: focusNode,
        padding: EdgeInsets.zero,
        child: Container(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            constraints: const BoxConstraints(minHeight: 48),
            decoration: context.decoration.fieldBackground.copyWith(color: backgroundColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: child,
                ),
                FieldIcon(CupertinoIcons.chevron_down, color: foregroundColor),
              ],
            )),
      );
}
