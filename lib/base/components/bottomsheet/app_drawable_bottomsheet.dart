/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import 'bottomsheet_container.dart';

class AppDraggableBottomSheet extends StatefulWidget {
  const AppDraggableBottomSheet({
    required this.builder, super.key,
    this.expand = true,
    this.background = Colors.white,
    this.title,
    this.initialChildSize = 0.9,
    this.minChildSize = 0.9,
    this.hasTitle = false,
    this.bottomInset = 0,
  });

  final Widget Function(BuildContext context, ScrollController scrollController) builder;
  final bool expand;
  final Color background;
  final String? title;
  final double initialChildSize;
  final double minChildSize;
  final bool hasTitle;
  final double bottomInset;

  @override
  State<AppDraggableBottomSheet> createState() => _AppDraggableBottomSheetState();
}

class _AppDraggableBottomSheetState extends State<AppDraggableBottomSheet> {
  final DraggableScrollableController controller = DraggableScrollableController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: DraggableScrollableSheet(
          maxChildSize: 0.9,
          expand: widget.expand,
          shouldCloseOnMinExtent: true,
          initialChildSize: widget.initialChildSize,
          minChildSize: widget.minChildSize,
          builder: (context, scrollController) => AppBottomSheetContainer(
            title: widget.title,
            background: widget.background,
            hasTitle: widget.hasTitle,
            bottomInset: widget.bottomInset,
            child: widget.builder(context, scrollController),
          ),
          controller: controller,
          snap: true,
          snapAnimationDuration: const Duration(milliseconds: 350),
        ),
      );
}
