/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:built_collection/built_collection.dart';

import 'transaction_label.dart';
import 'transaction_wallet_index.dart';

mixin TransactionWalletInterface {
  String get id;

  TransactionWalletIndexInterface get walletIndex;

  String get name;

  BuiltList<TransactionLabelInterface> get label;

  String get descriptions;
}
