/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:injectable/injectable.dart';
import 'package:objectx/objectx.dart';
import 'package:realm/realm.dart';

import '../../../shared.dart';
import 'models/transaction_wallet_index_realm_model.dart';
import 'models/transaction_wallet_realm_model.dart';

@LazySingleton()
class TransactionWalletRealm {
  TransactionWalletRealm() {
    final config = Configuration.local(
      [TransactionWalletIndexRealmModel.schema, TransactionWalletRealmModel.schema],
      schemaVersion: 5,
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

  List<TransactionWalletRealmModel> getWallets() => result.toList();

  void createWallet(TransactionWalletInterface newWallet) {
    final realmObject = TransactionWalletRealmModel(
      walletId(newWallet.id),
      newWallet.name,
      label: newWallet.label,
      descriptions: newWallet.descriptions,
      walletIndexIml: TransactionWalletIndexRealmModel(
        newWallet.walletIndex.id,
        newWallet.walletIndex.name,
        descriptions: newWallet.walletIndex.descriptions,
        color: newWallet.walletIndex.color,
        iconUrl: newWallet.walletIndex.iconUrl,
        inputIndex: newWallet.walletIndex.inputIndex,
        outputIndex: newWallet.walletIndex.outputIndex,
      ),
    );
    realm.write(() => realm.add(realmObject));
  }

  @disposeMethod
  void close() {
    realm.close();
  }
}
