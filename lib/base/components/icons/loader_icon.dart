/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class LoaderIcon extends StatelessWidget {
  const LoaderIcon({super.key, this.size = 56});

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: size,
        width: size,
        child: Transform.scale(
          scale: 3,
          alignment: Alignment.center,
          child: Assets.image.animations.icLoading.lottie(
            height: size,
            width: size,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      );
}
