/*
 Created by Thanh Son on 24/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';

import '../shared.dart';

class AppRefresh extends StatefulWidget {
  const AppRefresh({
    required this.onRefresh,
    required this.child,
    super.key,
    this.trigger = IndicatorTrigger.leadingEdge,
  });

  final Widget child;
  final Future<void> Function() onRefresh;
  final IndicatorTrigger trigger;

  @override
  State<AppRefresh> createState() => _AppRefreshState();
}

class _AppRefreshState extends State<AppRefresh> {
  final indicatorHeight = 200.0;
  final IndicatorController controller = IndicatorController();
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.isLoading) {
        final box = key.currentContext?.findRenderObject() as RenderBox?;
        final position = box?.localToGlobal(Offset.zero);
        AppToast.showLoader(from: position, timeout: const Duration(seconds: 3));
      }
    });
  }

  @override
  Widget build(BuildContext context) => CustomRefreshIndicator(
        offsetToArmed: indicatorHeight,
        indicatorSettleDuration: const Duration(milliseconds: 100),
        indicatorFinalizeDuration: Duration.zero,
        triggerMode: IndicatorTriggerMode.onEdge,
        trigger: widget.trigger,
        autoRebuild: true,
        controller: controller,
        builder: (context, child, controller) => Stack(children: [
          child,
          Positioned(
            top: indicatorHeight * (controller.value - 0.6),
            left: 0,
            right: 0,
            child: Center(child: LoaderIcon(key: key, size: 32)),
          )
        ]),
        child: widget.child,
        onRefresh: () async {
          widget.onRefresh();
        },
      );
}
