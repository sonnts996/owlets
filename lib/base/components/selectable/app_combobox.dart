/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../app_controller.dart';

class AppComboBox<T extends Object> extends StatefulWidget {
  const AppComboBox({
    required this.selectedBuilder,
    required this.nothingBuilder,
    required this.onTab,
    super.key,
    this.initialSelected,
    this.controller,
    this.valueGetter,
  }) : assert(!(initialSelected != null && controller != null));

  final T? initialSelected;

  final Widget Function(BuildContext context, T value, FocusNode focusNode) selectedBuilder;
  final Widget Function(BuildContext context, FocusNode focusNode) nothingBuilder;
  final Future<T?> Function(BuildContext context, SelectedController<T?> controller) onTab;
  final SelectedController<T?>? controller;
  final InternalValueGetter<T?>? valueGetter;

  @override
  State<AppComboBox> createState() => _AppComboBoxState<T>();
}

class _AppComboBoxState<T extends Object> extends State<AppComboBox<T>> {
  late final SelectedController<T?> _controller;
  final FocusNode _focusNode = FocusNode(debugLabel: 'AppComboBox');

  @override
  void initState() {
    _controller = widget.controller ?? SelectedController(widget.initialSelected);
    super.initState();
    widget.valueGetter?.closure = () => _controller.value;
  }

  @override
  void dispose() {
    widget.valueGetter?.close();
    super.dispose();
  }

  void setSelected(T? selected)  {
    _controller.toggle(selected);
  }

  @override
  Widget build(BuildContext context) => Focus(
        focusNode: _focusNode,
        child: GestureDetector(
          onTap: () async {
            final result = await widget.onTab(context, _controller);
            _focusNode.requestFocus();

            if (result != null) {
              setSelected(result);
            }
          },
          child: ValueListenableBuilder<T?>(
              valueListenable: _controller,
              builder: (context, value, child) =>
                  value?.let((it) => widget.selectedBuilder(context, it, _focusNode)) ??
                  widget.nothingBuilder(context, _focusNode)),
        ),
      );
}
