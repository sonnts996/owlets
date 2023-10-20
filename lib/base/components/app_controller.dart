/*
 Created by Thanh Son on 23/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

abstract class SelectedControllerMixin<T, E> extends ValueNotifier<E> {
  SelectedControllerMixin(super.value);

  bool isSelect(T other);

  void toggle(T value);
}

class SelectedController<T> extends SelectedControllerMixin<T, T> {
  SelectedController(super.value);

  @override
  bool isSelect(T other) => value == other;

  @override
  void toggle(T value) {
    if (value != this.value) {
      this.value = value;
    }
  }
}

class MultiSelectedController<T> extends SelectedControllerMixin<T, List<T>> {
  MultiSelectedController(super.value);

  @override
  bool isSelect(T other) => value.contains(other);

  @override
  void toggle(T value) {
    if (this.value.contains(value)) {
      this.value.remove(value);
    } else {
      this.value.add(value);
    }
  }
}

class AppSelectable<T> extends StatelessWidget {
  const AppSelectable({super.key, required this.controller, required this.builder, required this.value});

  final SelectedController<T> controller;

  // ignore: avoid_positional_boolean_parameters
  final Widget Function(bool isSelected) builder;
  final T value;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: controller,
        builder: (context, child) => builder(controller.isSelect(value)),
      );
}

class AppMultiSelectable<T> extends StatelessWidget {
  const AppMultiSelectable({super.key, required this.controller, required this.builder, required this.value});

  final MultiSelectedController<T> controller;

  // ignore: avoid_positional_boolean_parameters
  final Widget Function(bool isSelected) builder;
  final T value;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
        listenable: controller,
        builder: (context, child) => builder(controller.isSelect(value)),
      );
}

class AppComboBox<T extends Object> extends StatefulWidget {
  const AppComboBox({
    super.key,
    required this.selectedBuilder,
    required this.nothingBuilder,
    required this.onTab,
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

  void setSelected(T? selected) async {
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
