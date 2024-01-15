/*
 Created by Thanh Son on 22/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../helper/formatterx.dart';
import 'ext/contextx.dart';

class RefreshTimeButton extends StatelessWidget {
  const RefreshTimeButton({
    required this.time,
    this.onPressed,
    super.key,
  });

  final DateTime time;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 26,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 6, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(CupertinoIcons.refresh_bold, size: 16),
                  4.horizontalSpacing,
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: context.scheme.inverseSurface.withOpacity(0.5)),
                        ),
                      ),
                      child: Text(AppFormatter.timeFormat(context, time).toLowerCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
