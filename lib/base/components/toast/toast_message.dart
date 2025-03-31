/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
part of 'app_toast.dart';

class ToastMessage extends StatelessWidget {
  const ToastMessage({
    required this.message,
    super.key,
    this.type = ToastType.information,
  });

  final String message;

  final ToastType type;

  Color background(BuildContext context) => switch (type) {
        ToastType.information => context.scheme.inverseSurface.withOpacity(0.3),
        ToastType.error => context.scheme.error.withOpacity(0.3),
        ToastType.warning => context.scheme.tertiary.withOpacity(0.3),
        ToastType.devLog => context.scheme.surfaceVariant,
      };

  Color foreground(BuildContext context) => switch (type) {
        ToastType.information => context.scheme.onInverseSurface,
        ToastType.error => context.scheme.onError,
        ToastType.warning => context.scheme.onTertiary,
        ToastType.devLog => context.scheme.onSurfaceVariant,
      };

  Widget? iconBuilder(BuildContext context) => switch (type) {
        ToastType.information => null,
        ToastType.error => Icon(CupertinoIcons.exclamationmark_circle, size: 24, color: foreground(context)),
        ToastType.warning => Icon(CupertinoIcons.exclamationmark_triangle, size: 24, color: foreground(context)),
        ToastType.devLog => Icon(CupertinoIcons.info_circle, size: 24, color: foreground(context)),
      };

  @override
  Widget build(BuildContext context) {
    final icon = iconBuilder(context);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      margin: 16.horizontalInsets,
      constraints: const BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(color: background(context), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(offset: const Offset(0, -4), child: icon ?? const SizedBox()),
          8.horizontalSpacing,
          Flexible(
            child: Padding(
              padding: 16.bottomInsets,
              child: AppLabel(
                message,
                textColor: foreground(context),
              ),
            ),
          ),
          8.horizontalSpacing,
        ],
      ),
    );
  }
}
