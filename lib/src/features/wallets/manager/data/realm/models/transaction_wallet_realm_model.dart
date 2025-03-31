/*
 Created by Thanh Son on 02/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'dart:ui';

import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';
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
  ObjectId id = ObjectId();

  @override
  List<String> label = [];

  @override
  late String name;

  @MapTo('walletIndex')
  $TransactionWalletIndexRealmModel? walletIndexIml;

  @override
  @Ignored()
  TransactionWalletIndexInterface get walletIndex => walletIndexIml!;

  @MapTo('color')
  String? colorHex;

  @override
  Color get color => colorHex?.let(ColorX.fromHex) ?? const Color(0x00000000);
}
