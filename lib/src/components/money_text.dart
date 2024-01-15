/*
 Created by Thanh Son on 21/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:objectx/objectx.dart';

import '../injections/injections.dart';
import 'ext/contextx.dart';

part 'money_obscure.dart';

enum MoneyTextStyle {
  small,
  medium,
  large;

  TextStyle style(BuildContext context) {
    switch (this) {
      case MoneyTextStyle.small:
        return context.transactionTheme.smallStyle;
      case MoneyTextStyle.medium:
        return context.transactionTheme.mediumStyle;
      case MoneyTextStyle.large:
        return context.transactionTheme.largeStyle;
    }
  }

  double obscuredSize(BuildContext context) {
    switch (this) {
      case MoneyTextStyle.small:
        return context.transactionTheme.smallIconSize;
      case MoneyTextStyle.medium:
        return context.transactionTheme.mediumIconSize;
      case MoneyTextStyle.large:
        return context.transactionTheme.largeIconSize;
    }
  }
}

enum MoneyType {
  amount,
  changed;

  Color color(BuildContext context, {bool negative = false}) {
    switch (this) {
      case MoneyType.amount:
        return context.transactionTheme.let((it) => negative ? it.negativeColor : it.positiveColor);
      case MoneyType.changed:
        return context.transactionTheme.let((it) => negative ? it.removeColor : it.addColor);
    }
  }
}

class MoneyText extends StatelessWidget {
  const MoneyText(
    this.amount, {
    required this.currency,
    required this.obscuredNotifier,
    this.textStyle = MoneyTextStyle.medium,
    this.type = MoneyType.amount,
    this.canToggleObscurity = false,
    this.revert = false,
    super.key,
  });

  final double amount;
  final String currency;
  final MoneyTextStyle textStyle;
  final MoneyType type;
  final MoneyObscured obscuredNotifier;
  final bool canToggleObscurity;

  final bool revert;

  bool get obscured => obscuredNotifier.obscured;

  String numberFormat(BuildContext context) {
    if (obscured) return '***';
    final format = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).languageCode,
      name: currency,
    );
    return format.format(amount);
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<bool>(
        valueListenable: obscuredNotifier,
        builder: (context, value, child) => IgnorePointer(
          ignoring: !canToggleObscurity,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: obscuredNotifier.toggle,
            child: Text.rich(
              TextSpan(
                children: buildList(context),
              ),
              style: textStyle.style(context).apply(
                    color: type.color(
                      context,
                      negative: amount < 0,
                    ),
                  ),
            ),
          ),
        ),
      );

  List<InlineSpan> buildList(BuildContext context) {
    final lst = [
      TextSpan(text: numberFormat(context)),
      if (canToggleObscurity) ...[
        const TextSpan(text: ' '),
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Icon(
            obscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
            size: textStyle.obscuredSize(context),
            color: context.displayColor,
          ),
        ),
      ],
    ];
    return revert ? lst.reversed.toList() : lst;
  }
}

class ObscuredIcon extends StatelessWidget {
  const ObscuredIcon({
    required this.obscuredNotifier,
    this.color,
    this.useActionBarTheme = true,
    super.key,
  });

  final MoneyObscured obscuredNotifier;
  final Color? color;
  final bool useActionBarTheme;

  @override
  Widget build(BuildContext context) => IconTheme(
        data: useActionBarTheme.let(
              (it) => it ? context.theme.appBarTheme.iconTheme?.copyWith(color: color) : null,
            ) ??
            IconThemeData(color: color),
        child: ValueListenableBuilder<bool>(
          valueListenable: obscuredNotifier,
          builder: (context, value, child) => IconButton(
            onPressed: obscuredNotifier.toggle,
            icon: Icon(obscuredNotifier.obscured ? CupertinoIcons.eye : CupertinoIcons.eye_slash),
          ),
        ),
      );
}
