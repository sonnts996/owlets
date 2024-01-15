/*
 Created by Thanh Son on 04/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:objectx/objectx.dart';

import '../../../components/ext/contextx.dart';

class WalletButton extends StatelessWidget {
  const WalletButton({
    required this.name,
    required this.onTab,
    this.color,
    super.key,
  });

  final String name;
  final Color? color;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: onTab,
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      fixedSize: const Size(double.infinity, 24),
      minimumSize: const Size(50, 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      foregroundColor: color,
      textStyle: context.textTheme.labelMedium,
      side: color?.let((it) => BorderSide(color: it)),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    child: Text(name),
  );
}
