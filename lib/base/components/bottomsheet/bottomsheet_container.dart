/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../gen/assets.gen.dart';
import '../../utilities/shared.dart';
import '../app_text.dart';

class AppBottomSheetContainer extends StatelessWidget {
  const AppBottomSheetContainer({
    required this.child,
    super.key,
    this.background,
    this.title,
    this.hasTitle = false,
    this.bottomInset = 0,
  });

  final Color? background;
  final String? title;
  final bool hasTitle;
  final Widget child;
  final double bottomInset;

  @override
  Widget build(BuildContext context) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasTitle)
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  16.horizontalSpace,
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: ImageFiltered(
                        imageFilter: ColorFilter.mode(context.scheme.surface, BlendMode.srcIn),
                        // enabled: false,
                        child: Assets.image.animations.icClose.lottie(
                          height: 24,
                          width: 24,
                          fit: BoxFit.cover,
                          repeat: false,
                        )),
                  ),
                  8.horizontalSpace,
                  Expanded(child: AppHeader(title ?? '', textColor: context.scheme.surface)),
                  8.horizontalSpace,
                  Container(
                      height: 6,
                      width: 30,
                      decoration: BoxDecoration(color: context.scheme.surface, borderRadius: BorderRadius.circular(4))),
                  16.horizontalSpace,
                ],
              ),
            4.verticalSpace,
            Flexible(
              fit: FlexFit.loose,
              child: Material(
                color: background,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
                child: Padding(
                  padding: bottomInset.verticalInsets,
                  child: child,
                ),
              ),
            ),
          ]);
}
