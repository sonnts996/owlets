/*
 Created by Thanh Son on 26/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import '../../../shared/interfaces/transaction_wallet.dart';
import '../datasource/transaction_wallet_datasource.dart';

TransactionWalletDatasource create() => TransactionWalletWebDatasource();

class TransactionWalletWebDatasource extends TransactionWalletDatasource {
  TransactionWalletWebDatasource();

  @override
  Future<TransactionWalletInterface> createWallet(TransactionWalletInterface newWallet) async {
    throw Exception();
  }

  @override
  List<TransactionWalletInterface> getWallets() => [];

  @override
  void close() {
    // TODO: implement close
  }
}
