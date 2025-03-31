/*
 Created by Thanh Son on 22/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';

import '../../shared.dart';

class AddFloatingBarIcon extends StatelessWidget {
  const AddFloatingBarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Icon(
        CupertinoIcons.add,
        color: context.theme.floatingActionButtonTheme.foregroundColor,
        size: context.theme.floatingActionButtonTheme.iconSize,
        semanticLabel: 'add-new',
      );
}
