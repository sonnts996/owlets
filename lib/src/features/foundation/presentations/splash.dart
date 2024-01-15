/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../../application/app.dart';
import '../../../../gen/assets/assets.gen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(milliseconds: 350),
        () => Navigator.of(context).pushReplacementNamed(OwletApp.service.route.home.path),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Material(
        child: Center(
          child: Assets.images.logoOwlet.svg(
            width: 200,
            height: 200,
            colorFilter: ColorFilter.mode(
              Theme.of(context).primaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      );
}
