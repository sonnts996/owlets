/*
 Created by Thanh Son on 09/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'package:dartz/dartz.dart' show Tuple2;
import 'package:flutter/material.dart';
import 'package:overlay_manager/overlay_manager.dart';

class OverlayOptions extends StatefulWidget {
  const OverlayOptions({
    required this.overlay,
    required this.child,
    this.focusNode,
    this.offset = Offset.zero,
    super.key,
  });

  final Widget overlay;
  final Offset offset;
  final FocusNode? focusNode;
  final Widget child;

  @override
  State<OverlayOptions> createState() => OverlayOptionsState();
}

class OverlayOptionsState extends State<OverlayOptions> with WidgetsBindingObserver {
  final GlobalKey key = GlobalKey(debugLabel: 'AutoCompleteField');
  late final OverlayManager manager = ContextOverlayManager(context: context);
  final overlayRect = ValueNotifier(
    const Tuple2(Rect.zero, Alignment.topLeft),
  );

  Rect? _viewport;

  Rect get viewport {
    if (_viewport != null) return _viewport!;
    final viewSize = MediaQuery.of(context).size;
    final viewPadding = MediaQuery.of(context).padding;
    _viewport ??= Rect.fromLTWH(
      viewPadding.left,
      viewPadding.top,
      viewSize.width - (viewPadding.left + viewPadding.right),
      viewSize.height - (viewPadding.top - viewPadding.bottom),
    );
    return _viewport!;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    widget.focusNode?.addListener(onFocused);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OverlayOptions oldWidget) {
    if (widget.focusNode != oldWidget.focusNode) {
      widget.focusNode?.addListener(onFocused);
      oldWidget.focusNode?.removeListener(onFocused);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    widget.focusNode?.removeListener(onFocused);
    manager.closeAll();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    overlayRect.value = getPosition();
  }

  void onFocused() {
    if (!(widget.focusNode?.hasFocus ?? false)) {
      manager.closeAll();
    }
  }

  Tuple2<Rect, Alignment> getPosition() {
    final box = key.currentContext?.findRenderObject() as RenderBox?;
    final position = box?.localToGlobal(Offset.zero);
    final size = box?.size ?? Size.zero; //this is global position
    final offset = position ?? Offset.zero;
    var rect = Rect.fromLTWH(
      offset.dx + widget.offset.dx,
      offset.dy + size.height + widget.offset.dy,
      size.width,
      200,
    );

    if ((viewport.bottom - rect.top) <= 100) {
      rect = Rect.fromLTRB(rect.left, offset.dy - rect.height, rect.right, offset.dy);
      return Tuple2(rect, Alignment.bottomLeft);
    } else {
      return Tuple2(rect, Alignment.topLeft);
    }
  }

  void close() {
    manager.closeAll();
  }

  void show() {
    if (!(widget.focusNode?.hasFocus ?? true)) {
      widget.focusNode?.requestFocus();
    }
    if (manager.count == 0) {
      manager.show(
        mode: OverlayMode.transparent,
        builder: (context, entry) => Align(
          alignment: Alignment.topLeft,
          child: ValueListenableBuilder<Tuple2<Rect, Alignment>>(
            valueListenable: overlayRect,
            builder: (context, value, child) => Transform.translate(
              offset: value.value1.topLeft,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: value.value1.height,
                  maxWidth: value.value1.width,
                  minWidth: value.value1.width,
                ),
                child: Align(alignment: value.value2, child: child),
              ),
            ),
            child: Card(clipBehavior: Clip.antiAlias, child: widget.overlay),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => SizedBox(key: key, child: widget.child);
}
