/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'package:flutter/widgets.dart';

import 'wallet_index_interface.dart';

abstract class WalletInterface {
   String get name;
   String get description;
   Iterable<String> get tags;
   Color get color;

   DateTime get createTime;

   DateTime get modifyTime;

   WalletIndexInterface get index;
}