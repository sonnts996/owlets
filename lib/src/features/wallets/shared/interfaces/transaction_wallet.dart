/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'transaction_wallet_index.dart';

mixin TransactionWalletInterface {
  String get id;

  TransactionWalletIndexInterface get walletIndex;

  String get name;

  List<String> get label;

  String get descriptions;
}
