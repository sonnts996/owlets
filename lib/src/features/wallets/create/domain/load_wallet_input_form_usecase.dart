/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../base/base.dart';
import '../../wallets.dart';

@LazySingleton()
class LoadWalletInputFormUseCase with UseCaseWithoutParams<Either<OBException, List<TransactionWalletIndexInterface>>> {
  LoadWalletInputFormUseCase({required this.repository});

  final WalletManagerRepository repository;

  @override
  Future<Either<OBException, List<TransactionWalletIndexInterface>>> execute() => repository.getWalletIndex();
}
