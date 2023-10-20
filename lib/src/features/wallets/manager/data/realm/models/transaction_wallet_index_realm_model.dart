/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:realm/realm.dart';

import '../../../../shared.dart';

part 'transaction_wallet_index_realm_model.g.dart';

@RealmModel()
class $TransactionWalletIndexRealmModel with TransactionWalletIndexInterface {
  @override
  int color = 0;

  @override
  String descriptions = '';

  @override
  String iconUrl = '';

  @override
  @PrimaryKey()
  late int id;

  @override
  int inputIndex = 0;

  @override
  late String name;

  @override
  int outputIndex = 0;
}
