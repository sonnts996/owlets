/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../gen/assets/assets.gen.dart';
import '../../../../components/ext/contextx.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration:
                  BoxDecoration(color: context.scheme.secondaryContainer, borderRadius: BorderRadius.circular(8)),
              child: Assets.images.owletEgg.lottie(height: 64, width: 64),
            ),
            8.verticalSpacing,
            Text(
              'Chờ xíu nhé, Trứng sắp nở rồi!^^',
              style: context.textTheme.labelMedium?.apply(color: context.scheme.onInverseSurface),
            ),
          ],
        ),
      );
}
