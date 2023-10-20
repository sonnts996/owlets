/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../../base/shared.dart';

class BaseItemMenu extends StatelessWidget {
  const BaseItemMenu(
      {super.key, required this.child, this.crossAxisCellCount = 1, this.mainAxisCellCount = 1, this.onTab});

  final Widget child;
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) => StaggeredGridTile.count(
        crossAxisCellCount: crossAxisCellCount,
        mainAxisCellCount: mainAxisCellCount,
        child: AspectRatio(
          aspectRatio: mainAxisCellCount / crossAxisCellCount,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 9, 9, 10),
            child: InkWell(
              onTap: onTab,
              borderRadius: context.decoration.secondaryTile.borderRadius?.resolve(TextDirection.ltr),
              child: Ink(
                decoration: context.decoration.secondaryTile,
                child: Center(child: child),
              ),
            ),
          ),
        ),
      );
}
