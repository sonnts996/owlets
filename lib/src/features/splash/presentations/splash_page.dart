/*
 Created by Thanh Son on 18/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../application/owlet_app_global_provider.dart';
import '../../../../base/base.dart';
import '../../../../gen/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  final Tween<double> _tween = Tween(begin: 1, end: 0);

  @override
  Widget build(BuildContext context) => Material(
        child: Stack(children: [
          Center(
              child: ShaderMask(
                  shaderCallback: (bounds) => context.components.decoration.higherGradient.createShader(bounds),
                  child: Assets.image.logoOwlet.svg(width: 300))),
          TweenAnimationBuilder(
            tween: _tween,
            duration: context.components.animations.longDuration,
            curve: Curves.easeInOutBack,
            onEnd: () {
              Future.delayed(
                Duration(milliseconds: 350),
                () => OwletAppGlobal.routesInst.home.pushReplacementNamed(context),
              );
            },
            builder: (context, value, child) => Positioned(
              top: 0,
              left: 0,
              width: _scaleW(value),
              height: _scaleH(value),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: ((1 - value) * 100).circleBorderRadius,
                  gradient: context.components.decoration.primaryGradient,
                ),
              ),
            ),
          ),
        ]),
      );

  double _scaleW(double value) {
    if (value <= 0.5) {
      return value.sw;
    } else {
      return value.sw;
    }
  }

  double _scaleH(double value) {
    if (value <= 0.5) {
      return value.sw;
    } else {
      return value.sh;
    }
  }
}
