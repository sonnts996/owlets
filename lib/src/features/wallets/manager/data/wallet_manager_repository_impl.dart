/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared/domain/wallet_manager_repository.dart';
import '../../shared/interfaces/transaction_wallet.dart';
import '../../shared/interfaces/transaction_wallet_index.dart';
import 'datasource/transaction_wallet_index_datasource.dart';
import 'realm/transaction_wallet_realm.dart';

@LazySingleton(as: WalletManagerRepository)
class WalletManagerRepositoryImpl extends WalletManagerRepository {
  WalletManagerRepositoryImpl({
    required this.walletIndexDatasource,
    required this.walletRealm,
  });

  final TransactionWalletIndexDatasource walletIndexDatasource;
  final TransactionWalletRealm walletRealm;

  @override
  Future<Either<OBException, List<TransactionWalletIndexInterface>>> getWalletIndex() async {
    try {
      final result = await walletIndexDatasource.getData();
      return Right(result);
    } on OBException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(OBException(error: e));
    }
  }

  @override
  Future<Either<OBException, void>> createWallet(TransactionWalletInterface newWallet) async {
    try {
      walletRealm.createWallet(newWallet);
      return Right(null);
    } on OBException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(OBException(error: e));
    }
  }

  @override
  Future<Either<OBException, List<TransactionWalletInterface>>> getWallets() async {
    try {
      final result = walletRealm.getWallets();
      return Right(result);
    } on OBException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(OBException(error: e));
    }
  }
}
