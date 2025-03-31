/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../utilities/shared.dart';
import '../app_text.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    required this.child, super.key,
    this.onTab,
    this.semanticLabel = 'custom-primary-button',
    this.height = 50,
    this.width = double.infinity,
  });

  final Widget child;
  final VoidCallback? onTab;
  final String semanticLabel;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) => Semantics(
        label: semanticLabel,
        onTap: onTab,
        child: InkWell(
          onTap: onTab,
          borderRadius: 100.circleBorderRadius,
          child: Ink(
            height: height,
            width: width,
            decoration: context.decoration.primaryButton,
            child: child,
          ),
        ),
      );
}

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    this.text = '',
    this.margin = EdgeInsets.zero,
    this.onTab,
  });

  final String text;
  final EdgeInsets margin;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin,
        child: SizedBox(
          height: 50,
          child: CustomPrimaryButton(
            onTab: onTab,
            child: Center(
                child: AppDisplay(
              text,
              textColor: context.scheme.onPrimary,
            )),
          ),
        ),
      );
}
