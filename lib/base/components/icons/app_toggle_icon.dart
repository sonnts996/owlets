/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';

class AppToggleIcon extends StatefulWidget {
  const AppToggleIcon({
    required this.icon,
    required this.unselectedIcon,
    required this.onTab,
    super.key,
    this.transitionDuration = const Duration(milliseconds: 350),
    this.size = 24,
    this.isSelected = false,
  });

  final Widget icon;
  final Widget unselectedIcon;
  final Duration transitionDuration;
  final double size;
  final bool isSelected;
  final ValueChanged<bool> onTab;

  @override
  State<AppToggleIcon> createState() => _AppToggleIconState();
}

class _AppToggleIconState extends State<AppToggleIcon> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(vsync: this, duration: widget.transitionDuration);
  late final Animation<double> animation = Tween<double>(begin: 0, end: 1).animate(controller);

  @override
  void initState() {
    super.initState();
    if (widget.isSelected) {
      controller.value = 1;
    } else {
      controller.value = 0;
    }
  }

  @override
  void didUpdateWidget(covariant AppToggleIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSelected) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => widget.onTab(!widget.isSelected),
        child: SizedBox.square(
          dimension: widget.size,
          child: Stack(children: [
            AnimatedBuilder(
              animation: animation,
              child: widget.icon,
              builder: (context, child) => Opacity(opacity: animation.value, child: child),
            ),
            AnimatedBuilder(
              animation: animation,
              child: widget.unselectedIcon,
              builder: (context, child) => Opacity(opacity: 1 - animation.value, child: child),
            ),
          ]),
        ),
      );
}
