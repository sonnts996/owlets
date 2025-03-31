/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../utilities/context_reader.dart';
import '../app_text.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    required this.text,
    super.key,
    this.prefix,
    this.suffix,
    this.onTab,
    this.constraints,
  });

  final String text;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTab;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) => Container(
        constraints: constraints,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(color: context.scheme.surfaceVariant, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (suffix != null) ...[suffix!, 4.horizontalSpacing],
            Flexible(
                flex: 1,
                child: AppLabel(
                  text,
                  textColor: context.scheme.onSurfaceVariant,
                  overflow: TextOverflow.ellipsis,
                )),
            if (prefix != null) ...[4.horizontalSpacing, prefix!]
          ],
        ),
      );
}

class AppActionChip extends StatelessWidget {
  const AppActionChip({
    required this.text,
    super.key,
    this.onTab,
    this.constraints,
  });

  final String text;
  final VoidCallback? onTab;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) => AppChip(
        constraints: constraints,
        text: text,
        onTab: onTab,
      );
}

class DeletableChip extends StatelessWidget {
  const DeletableChip(
    this.text, {
    super.key,
    this.onDelete,
  });

  final VoidCallback? onDelete;
  final String text;

  @override
  Widget build(BuildContext context) => AppChip(
        prefix: GestureDetector(
            onTap: onDelete,
            child: Icon(
              CupertinoIcons.clear_thick,
              size: 16,
              color: context.scheme.onSurfaceVariant,
            )),
        text: text,
      );
}
