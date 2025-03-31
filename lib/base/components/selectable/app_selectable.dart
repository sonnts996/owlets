/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import '../app_controller.dart';

class AppSelectable<T> extends StatelessWidget {
  const AppSelectable({
    required this.controller,
    required this.builder,
    required this.value,
    super.key,
  });

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
  const AppMultiSelectable({required this.controller, required this.builder, required this.value, super.key});

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
