/*
 Created by Thanh Son on 02/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:realm/realm.dart';

import '../../../../shared.dart';
import 'transaction_wallet_index_realm_model.dart';

part 'transaction_wallet_realm_model.g.dart';

@RealmModel()
class _TransactionWalletRealmModel with TransactionWalletInterface {
  @override
  String descriptions = '';

  @override
  @PrimaryKey()
  late String id;

  @override
  List<String> label = [];

  @override
  late String name;

  $TransactionWalletIndexRealmModel? walletIndexIml;

  @override
  TransactionWalletIndexInterface get walletIndex => walletIndexIml!;
}
