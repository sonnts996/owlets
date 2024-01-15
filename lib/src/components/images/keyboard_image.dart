/*
 Created by Thanh Son on 10/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';

import '../../../gen/assets/assets.gen.dart';
import '../ext/contextx.dart';

class KeyboardImage extends StatelessWidget {
  const KeyboardImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
      width: 200,
      height: 100,
      child: Assets.images.nounKeyboard6427148.svg(
        width: 200,
        fit: BoxFit.fitWidth,
        alignment: const Alignment(0, -0.35),
        colorFilter: ColorFilter.mode(context.scheme.outline.withOpacity(0.7), BlendMode.srcIn),
      ),
    );
}