/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import 'bottomsheet_container.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    this.builder,
    this.background,
    this.child,
    this.actions = const [],
    this.title,
    this.hasTitle = true,
    this.bottomInset = 0,
  }) : assert(child != null || builder != null, 'One of child or builder must be special.');

  final TransitionBuilder? builder;
  final Widget? child;
  final Color? background;
  final List<Widget> actions;
  final String? title;
  final bool hasTitle;
  final double bottomInset;

  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AppBottomSheetContainer(
          title: title,
          hasTitle: hasTitle,
          background: background,
          bottomInset: bottomInset,
          child: builder?.call(context, child) ?? child!,
        ),
      );
}
