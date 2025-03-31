/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/material.dart';

import '../../utilities/shared.dart';

class FieldIcon extends StatelessWidget {
  const FieldIcon(this.icon, {super.key, this.color});

  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) => Icon(
        icon,
        size: 20,
        color: color ?? context.scheme.secondary,
      );
}
