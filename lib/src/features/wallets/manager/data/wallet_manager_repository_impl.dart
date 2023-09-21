/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/utilities/exceptions.dart';
import '../../shared/domain/wallet_manager_repository.dart';
import '../../shared/interfaces/transaction_wallet_index.dart';
import 'datasource/transaction_wallet_index_datasource.dart';

@LazySingleton(as: WalletManagerRepository)
class WalletManagerRepositoryImpl extends WalletManagerRepository {
  WalletManagerRepositoryImpl({required this.walletIndexDatasource});

  final TransactionWalletIndexDatasource walletIndexDatasource;

  @override
  Future<Either<OBException, List<TransactionWalletIndexInterface>>> getWalletIndex() async {
    try {
      final result = await walletIndexDatasource.getData();
      return Right(result);
    } on OBException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(OBException());
    }
  }
}
