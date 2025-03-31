/*
 Created by Thanh Son on 23/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

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
