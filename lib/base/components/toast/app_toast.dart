/*
 Created by Thanh Son on 10/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

library apptoast;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:objectx/objectx.dart';
import 'package:overlay_manager/overlay_manager.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:owlet_toast/owlet_toast.dart';

import '../../../application/owlet_app_global_provider.dart';
import '../../../gen/assets.gen.dart';
import '../../shared.dart';

part 'animation_toast.dart';

part 'app_loader.dart';

part 'toast_message.dart';

enum ToastType {
  information,
  error,
  warning,
  devLog,
}

@LazySingleton()
class AppToast extends OwletToast {

  AppToast({required super.overlayManager}) : super(defaultAlignment: const Alignment(0, -0.8));
  @factoryMethod
  factory AppToast.create() => AppToast(
          overlayManager: GlobalOverlayManager(
        navigatorKey: OwletAppGlobal.serviceInst.navigationKey,
      ));

  OverlayManagerEntry? loaderEntry;

  static Future<T?> showInformation<T extends Object>(String message) => getIt.get<AppToast>().show<T>(
      holdDuration: const Duration(seconds: 2),
      transitionDelegate: const FadeTransitionDelegate(),
      child: ToastMessage(
        message: message,
        type: ToastType.information,
      ));

  static Future<T?> showError<T extends Object>(OBException exception) {
    OBLogs.error(
        error: exception,
        stackTrace: exception.stackTrace,
        message: [exception.devDescription, exception.displayTitle, exception.displayMessage]
            .where((element) => element != null)
            .join('\n'));
    return getIt.get<AppToast>().show<T>(
        holdDuration: const Duration(seconds: 1),
        transitionDuration: const Duration(seconds: 1),
        transitionDelegate: const ShakeTransitionDelegate(),
        child: ToastMessage(
          message: exception.displayMessage ?? 'Something was wrong!!!',
          type: ToastType.error,
        ));
  }

  static Future<T?> showSuccess<T extends Object>(String message) => getIt.get<AppToast>().show<T>(
      holdDuration: const Duration(seconds: 1),
      transitionDuration: const Duration(seconds: 1),
      transitionDelegate: const FadeTransitionDelegate(),
      child: AnimatedToast(message: message, transitionDuration: const Duration(seconds: 1)));

  static Future<T?> showDevLog<T extends Object>(String message) async {
    if (kDebugMode) {
      return getIt.get<AppToast>().show<T>(
          holdDuration: const Duration(seconds: 1),
          transitionDuration: const Duration(seconds: 1),
          transitionDelegate: const FadeTransitionDelegate(),
          child: ToastMessage(
            message: message,
            type: ToastType.devLog,
          ));
    }
    return null;
  }

  static void showLoader(
      {String? message, Offset? from, Duration timeout = const Duration(days: 1), VoidCallback? onTimeout}) {
    message?.let(OBLogs.log);
    final appToast = getIt.get<AppToast>();
    appToast.loaderEntry?.close();
    appToast.loaderEntry = appToast.overlayManager.show(
        isDismissible: false,
        mode: OverlayMode.transparent,
        barrierColor: Colors.transparent,
        builder: (context, entry) => AppLoader(
              from: from,
              timeout: timeout,
              onTimeout: () {
                entry.close();
                onTimeout?.call();
              },
            ));
  }

  static void hideLoader([String? message]) {
    message?.let(OBLogs.log);
    final appToast = getIt.get<AppToast>();
    appToast.loaderEntry?.close();
  }
}
