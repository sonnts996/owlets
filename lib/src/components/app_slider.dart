/*
 Created by Thanh Son on 22/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

class AppSlider extends StatelessWidget {
  const AppSlider({
    required this.pageController,
    super.key,
    this.children = const [],
    this.height = 100,
  });

  final List<Widget> children;
  final double height;
  final PageController pageController;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: PageView(
          controller: pageController,
          padEnds: false,
          physics: const ClampingScrollPhysics(),
          children: children
              .map(
                (e) => Padding(
                  padding: EdgeInsets.fromLTRB(
                    children.first == e ? 16 : 16,
                    6,
                    children.last == e ? 16 : 16,
                    16,
                  ),
                  child: e,
                ),
              )
              .toList(),
        ),
      );
}
