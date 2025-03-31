/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:realm/realm.dart';

import '../../../shared.dart';
import '../datasource/transaction_wallet_datasource.dart';
import 'models/transaction_wallet_index_realm_model.dart';
import 'models/transaction_wallet_realm_model.dart';

TransactionWalletDatasource create() => TransactionWalletRealm();

class TransactionWalletRealm extends TransactionWalletDatasource {
  TransactionWalletRealm() {
    final config = Configuration.local(
      [TransactionWalletIndexRealmModel.schema, TransactionWalletRealmModel.schema],
      schemaVersion: 6,
      shouldDeleteIfMigrationNeeded: true,
    );
    realm = Realm(config);
    result = realm.all<TransactionWalletRealmModel>()
      ..changes.listen((event) {
        event.results.print(tag: 'TransactionWalletRealm');
      });
  }

  late final Realm realm;

  late final RealmResults<TransactionWalletRealmModel> result;

  String walletId(String origin) {
    if (origin.isNotEmpty) {
      return origin;
    }
    return Uuid.v1().toString();
  }

  @override
  List<TransactionWalletRealmModel> getWallets() => result.toList();

  @override
  Future<TransactionWalletInterface> createWallet(TransactionWalletInterface newWallet) async {
    final realmObject = TransactionWalletRealmModel(
      ObjectId(),
      newWallet.name,
      label: newWallet.label,
      descriptions: newWallet.descriptions,
      colorHex: newWallet.color.toHex(),
      walletIndexIml: TransactionWalletIndexRealmModel(
        newWallet.walletIndex.id,
        newWallet.walletIndex.name,
        descriptions: newWallet.walletIndex.descriptions,
        colorHex: newWallet.walletIndex.color.toHex(),
        iconUrl: newWallet.walletIndex.iconUrl,
        inputIndex: newWallet.walletIndex.inputIndex,
        outputIndex: newWallet.walletIndex.outputIndex,
      ),
    );
    realm.write(() => realm.add(realmObject, update: true));
    return realmObject;
  }

  @override
  void close() {
    realm.close();
  }
}
