/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:built_collection/built_collection.dart';

import '../../../wallets/shared.dart';

mixin TransactionLineInterface {
  DateTime get createTime;

  DateTime get validTime;

  double get amount;

  String get currencyCode;

  String get note;

  BuiltList<String> get label;

  TransactionWalletInterface get topUpWallet;

  TransactionWalletInterface get withdrawalWallet;
}
