/*
 Created by Thanh Son on 10/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:overlay_manager/overlay_manager.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:owlet_toast/owlet_toast.dart';

import '../../application/owlet_app_global_provider.dart';
import '../../gen/assets.gen.dart';
import '../shared.dart';

@injectable
class AppToast extends OwletToast {
  AppToast({required super.overlayManager}) : super(defaultAlignment: Alignment(0, -0.8));

  @factoryMethod
  static AppToast create() =>
      AppToast(overlayManager: GlobalOverlayManager(navigatorKey: OwletAppGlobal.serviceInst.navigationKey));

  static Future<T?> showInformation<T extends Object>(String message) => getIt.get<AppToast>().show<T>(
      holdDuration: Duration(seconds: 2),
      transitionDelegate: FadeTransitionDelegate(),
      child: ToastMessage(
        message: message,
        type: ToastType.information,
      ));

  static Future<T?> showError<T extends Object>(OBException exception) => getIt.get<AppToast>().show<T>(
      holdDuration: Duration(seconds: 1),
      transitionDuration: Duration(seconds: 1),
      transitionDelegate: ShakeTransitionDelegate(),
      child: ToastMessage(
        message: exception.displayMessage ?? 'Something was wrong!!!',
        type: ToastType.error,
      ));

  static Future<T?> showSuccess<T extends Object>(String message) => getIt.get<AppToast>().show<T>(
      holdDuration: Duration(seconds: 1),
      transitionDuration: Duration(seconds: 1),
      transitionDelegate: FadeTransitionDelegate(),
      child: AnimatedToast(message: message, transitionDuration: Duration(seconds: 1)));

  static Future<T?> showDevLog<T extends Object>(String message) async {
    if (kDebugMode) {
      return getIt.get<AppToast>().show<T>(
          holdDuration: Duration(seconds: 1),
          transitionDuration: Duration(seconds: 1),
          transitionDelegate: FadeTransitionDelegate(),
          child: ToastMessage(
            message: message,
            type: ToastType.devLog,
          ));
    }
    return null;
  }
}

enum ToastType {
  information,
  error,
  warning,
  devLog,
}

class ToastMessage extends StatelessWidget {
  const ToastMessage({
    super.key,
    required this.message,
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
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      margin: 16.horizontalInsets,
      constraints: BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(color: background(context), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(offset: Offset(0, -4), child: icon ?? SizedBox()),
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

class AnimatedToast extends StatefulWidget {
  const AnimatedToast({super.key, required this.message, required this.transitionDuration});

  final String message;
  final Duration transitionDuration;

  @override
  State<AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<AnimatedToast> with TickerProviderStateMixin {
  bool shouldShownText = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.transitionDuration, // lottie duration
        () {
      setState(() {
        shouldShownText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: 16.horizontalInsets,
      decoration: BoxDecoration(
          color: context.scheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: context.decoration.primaryShadow),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 350),
        alignment: Alignment.centerLeft,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.image.animations.successAnimations.lottie(
                height: 32,
                width: 32,
                repeat: false,
              ),
              if (shouldShownText)
                Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: AppLabel(
                      widget.message,
                      textColor: context.scheme.onBackground,
                    )),
            ]),
      ));
}
