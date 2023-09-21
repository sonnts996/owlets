/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';

import '../base.dart';

abstract class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.textColor,
    this.overflow,
    this.maxLines,
    this.textAlign,
  });

  final String data;
  final Color? textColor;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextAlign? textAlign;

  TextStyle? style(BuildContext context);

  @override
  Widget build(BuildContext context) => Text(
        data,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: textAlign,
        style: style(context)?.apply(color: textColor),
      );
}

class AppBarTitle extends AppText {
  const AppBarTitle(
    super.data, {
    super.key,
    super.textColor,
    super.overflow,
    super.maxLines,
    super.textAlign,
  });

  @override
  TextStyle? style(BuildContext context) => context.theme.textTheme.bodyLarge;
}

class AppTitle extends AppText {
  const AppTitle(
    super.data, {
    super.key,
    super.textColor,
    super.overflow,
    super.maxLines,
    super.textAlign,
  });

  @override
  TextStyle? style(BuildContext context) => context.theme.textTheme.titleMedium;
}

class AppLabel extends AppText {
  const AppLabel(
    super.data, {
    super.key,
    super.textColor,
    super.overflow,
    super.maxLines,
    super.textAlign,
  });

  @override
  TextStyle? style(BuildContext context) => context.theme.textTheme.labelMedium;
}

class AppFormLabel extends AppText {
  const AppFormLabel(
    super.data, {
    super.key,
    super.textColor,
    super.overflow,
    super.maxLines,
    super.textAlign,
  });

  @override
  String get data => super.data.toUpperCase();

  @override
  TextStyle? style(BuildContext context) => context.theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold);
}
