/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    this.text = '',
    this.margin = EdgeInsets.zero,
    this.onTab,
    this.semanticLabel,
  });

  final String text;
  final EdgeInsets margin;
  final VoidCallback? onTab;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: Semantics(
          label: semanticLabel ?? 'app-text-button',
          onTap: onTab,
          child: InkWell(
            onTap: onTab,
            borderRadius: 100.circleBorderRadius,
            splashColor: context.scheme.background,
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              color: Colors.transparent,
              child: Center(child: AppActionDisplay(text, textColor: context.scheme.primary)),
            ),
          ),
        ),
      );
}
