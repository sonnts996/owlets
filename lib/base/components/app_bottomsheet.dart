/*
 Created by Thanh Son on 22/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/context_reader.dart';
import 'app_text.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    this.builder,
    this.background,
    this.child,
    this.actions = const [],
    this.title,
    this.hasTitle = true,
  }) : assert(child != null || builder != null, 'One of child or builder must be special.');

  final TransitionBuilder? builder;
  final Widget? child;
  final Color? background;
  final List<Widget> actions;
  final String? title;
  final bool hasTitle;

  // static Future<T?> show<T>(
  //   BuildContext context, {
  //   Widget? child,
  //   TransitionBuilder? builder,
  //   bool isDismissible = true,
  //   Color? background,
  //   List<Widget> actions = const [],
  //   String? title,
  //   bool hasTitle = true,
  //   RouteSettings? routeSettings,
  // }) =>
  //     showWidget<T>(context,
  //         routeSettings: routeSettings,
  //         isDismissible: isDismissible,
  //         background: background,
  //         child: AppBottomSheet(
  //           child: child,
  //           builder: builder,
  //           background: background,
  //           actions: actions,
  //           title: title,
  //           hasTitle: hasTitle,
  //         ));
  //
  // static Future<T?> showWidget<T>(
  //   BuildContext context, {
  //   required Widget child,
  //   bool isDismissible = true,
  //   Color? background,
  //   RouteSettings? routeSettings,
  // }) =>
  //     showModalBottomSheet<T>(
  //       context: context,
  //       enableDrag: true,
  //       isDismissible: isDismissible,
  //       isScrollControlled: true,
  //       showDragHandle: false,
  //       useSafeArea: true,
  //       elevation: 0,
  //       routeSettings: routeSettings,
  //       builder: (context) => child,
  //     );

  @override
  Widget build(BuildContext context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          child: Material(
            color: background ?? context.scheme.background,
            borderOnForeground: true,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  8.verticalSpace,
                  if (hasTitle) ...[
                    8.verticalSpace,
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          16.horizontalSpace,
                          if (title != null) Expanded(child: AppHeader(title!)) else Spacer(),
                          ...actions,
                          10.horizontalSpace,
                        ])
                  ],
                  builder?.call(context, child) ?? child!,
                  SafeArea(child: 16.verticalSpace)
                ]),
          ),
        ),
      );
}

class AppListItemSheet extends StatelessWidget {
  const AppListItemSheet({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.itemCount,
    required this.itemBuilder,
    this.shrinkWrap = true,
  });

  final EdgeInsets padding;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: padding,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        physics: ClampingScrollPhysics(),
      );
}

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({super.key, required this.builder, required this.expand});

  final Widget Function(BuildContext context, ScrollController scrollController) builder;
  final bool expand;

  @override
  Widget build(BuildContext context) => DraggableScrollableSheet(minChildSize: 0.3, maxChildSize: 0.8, expand: expand, builder: builder);
}
