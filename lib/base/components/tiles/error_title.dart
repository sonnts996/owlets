/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';

import '../../shared.dart';

class ErrorTextTile extends StatelessWidget {
  const ErrorTextTile({
    required this.errorText,
    super.key,
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
