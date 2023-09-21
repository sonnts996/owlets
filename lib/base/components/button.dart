/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../base.dart';

class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({super.key, this.onTab, required this.child, this.semanticLabel = 'custom-primary-button'});

  final Widget child;
  final VoidCallback? onTab;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) => Semantics(
        label: semanticLabel,
        onTap: onTab,
        child: InkWell(
          onTap: onTab,
          borderRadius: 100.circleBorderRadius,
          child: Ink(decoration: context.components.decoration.primaryButton, child: child),
        ),
      );
}

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({super.key});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
