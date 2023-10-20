/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:dartz/dartz.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared.dart';

abstract class WalletManagerRepository {
  Future<Either<OBException, List<TransactionWalletIndexInterface>>> getWalletIndex();

  Future<Either<OBException, List<TransactionWalletInterface>>> getWallets();

  Future<Either<OBException, void>> createWallet(TransactionWalletInterface newWallet);
}
