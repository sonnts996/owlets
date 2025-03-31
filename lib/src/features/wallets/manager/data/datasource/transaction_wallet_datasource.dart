/*
 Created by Thanh Son on 26/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:injectable/injectable.dart';

import '../../../shared/interfaces/transaction_wallet.dart';
import '../web/transaction_wallet_web_datasource.dart' if (dart.library.io) '../realm/transaction_wallet_realm.dart' as impl;

@LazySingleton()
abstract class TransactionWalletDatasource {
  TransactionWalletDatasource();

  @factoryMethod
  factory TransactionWalletDatasource.create() => impl.create();

  List<TransactionWalletInterface> getWallets();

  Future<TransactionWalletInterface> createWallet(TransactionWalletInterface newWallet);

  void close();
}
