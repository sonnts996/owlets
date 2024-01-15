/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/bottom_appbar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    required this.onTab,
    super.key,
    this.currentIndex = -1,
  });

  final int currentIndex;
  final ValueChanged<int> onTab;

  @override
  Widget build(BuildContext context) => BottomAppBar(
        notchMargin: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: BottomAppbarItem(
                icon: const Icon(CupertinoIcons.rectangle_on_rectangle_angled),
                label: 'Ví',
                selected: currentIndex == 0,
                onTab: () => onTab(0),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: BottomAppbarItem(
                icon: const Icon(CupertinoIcons.table_badge_more),
                label: 'Giao dịch',
                selected: currentIndex == 1,
                onTab: () => onTab(1),
              ),
            ),
            const Spacer(),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: BottomAppbarItem(
                icon: const Icon(CupertinoIcons.square_favorites_alt),
                label: 'Kế hoạch',
                selected: currentIndex == 2,
                onTab: () => onTab(2),
              ),
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: BottomAppbarItem(
                icon: const Icon(CupertinoIcons.gear),
                label: 'Cài đặt',
                selected: currentIndex == 3,
                onTab: () => onTab(3),
              ),
            ),
          ],
        ),
      );
}
