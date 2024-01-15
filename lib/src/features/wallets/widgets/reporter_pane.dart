/*
 Created by Thanh Son on 12/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../components/ext/contextx.dart';
import '../../../components/money_text.dart';
import '../../../components/refresh_time_button.dart';

class ReporterPane extends StatelessWidget {
  const ReporterPane({
    required this.obscuredNotifier,
    super.key,
  });

  final MoneyObscured obscuredNotifier;

  @override
  Widget build(BuildContext context) => Card(
    elevation: 0,
    margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Tổng thu nhập',
                style: context.textTheme.labelLarge?.apply(fontWeightDelta: 2),
              ),
              const Spacer(),
              RefreshTimeButton(
                time: DateTime.now(),
                onPressed: () {},
              ),
            ],
          ),
          12.verticalSpacing,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MoneyText(
                  1325000,
                  currency: 'VND',
                  textStyle: MoneyTextStyle.large,
                  obscuredNotifier: obscuredNotifier,
                  canToggleObscurity: true,
                  revert: false,
                ),
              ),
              const Placeholder(
                fallbackHeight: 100,
                fallbackWidth: 100,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
