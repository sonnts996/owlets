/*
 Created by Thanh Son on 11/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';

class LerpAnimation<T> extends StatefulWidget {
  const LerpAnimation({
    required this.value,
    required this.builder,
    required this.onLerp,
    super.key,
    this.duration = const Duration(milliseconds: 350),
    this.child,
  });

  final T value;
  final Duration duration;

  final Widget? child;
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final T Function(T a, T b, double t) onLerp;

  @override
  State<LerpAnimation> createState() => _LerpAnimationState<T>();
}

class _LerpAnimationState<T> extends State<LerpAnimation<T>> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  )..repeat();

  late T oldValue;

  @override
  void initState() {
    oldValue = widget.value;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LerpAnimation<T> oldWidget) {
    if (oldWidget.value != widget.value) {
      oldValue = oldWidget.value;
      _controller.forward(from: 0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final newValue = widget.onLerp(oldValue, widget.value, _controller.value);
          return widget.builder(context, newValue, child);
        },
        child: widget.child,
      );
}
