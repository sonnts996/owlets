/*
 Created by Thanh Son on 22/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../shared.dart';

class ComboBoxLabelTile extends StatelessWidget {
  const ComboBoxLabelTile({
    super.key,
    required this.label,
    required this.child,
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
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
    super.key,
    required this.child,
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
            padding: padding ?? EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            constraints: BoxConstraints(minHeight: 48),
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

class IconTextTile extends StatelessWidget {
  const IconTextTile({
    super.key,
    required this.child,
    this.suffixIcon,
    this.prefixIcon,
    this.padding,
  });

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (prefixIcon != null) ...[prefixIcon!, 8.horizontalSpacing],
            Expanded(child: child),
            if (suffixIcon != null) ...[8.horizontalSpacing, suffixIcon!],
          ],
        ),
      );
}

class SelectableIconTextTile extends StatelessWidget {
  const SelectableIconTextTile({
    super.key,
    required this.label,
    this.icon,
    this.selected = false,
    this.onTab,
    this.padding,
  });

  final String label;
  final Widget? icon;
  final bool selected;
  final ValueChanged<bool>? onTab;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTab?.let((it) => () => it(selected)),
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, 8.horizontalSpacing],
              Expanded(child: AppDisplay(label)),
              if (onTab != null) ...[
                8.horizontalSpacing,
                AppCheckBox(value: selected, onTab: onTab!),
                16.horizontalSpacing
              ]
            ],
          ),
        ),
      );
}


class ErrorTextTile extends StatelessWidget {
  const ErrorTextTile({
    super.key,
    required this.errorText,
    this.verticalPadding,
  });

  final String? errorText;
  final EdgeInsets? verticalPadding;

  @override
  Widget build(BuildContext context) => IconTextTile(
      padding: verticalPadding?.copyWith(left: 12),
      prefixIcon: Icon(CupertinoIcons.exclamationmark_bubble, size: 16, color: context.scheme.error),
      child: AppCaptionError(errorText!));
}
