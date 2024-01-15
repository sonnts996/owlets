/*
 Created by Thanh Son on 23/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/widgets.dart';
import 'package:owlet_flutter/owlets.dart';

extension AppColorX on Color {
  Color get textColor => isLight ? const Color(0xFF424242) : const Color(0xFFFFFFFF);
}
