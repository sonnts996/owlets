/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared.dart';

@LazySingleton()
class LoadWalletListUseCase with UseCaseWithoutParams<Either<OBException, List<TransactionWalletInterface>>> {
  LoadWalletListUseCase({required this.repository});

  final WalletManagerRepository repository;

  @override
  Future<Either<OBException, List<TransactionWalletInterface>>> execute() => repository.getWallets();
}
