/*
 Created by Thanh Son on 04/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:built_value/built_value.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared.dart';

part 'create_wallet_usecase.g.dart';

abstract class CreateWalletParams
    with TransactionWalletInterface
    implements Built<CreateWalletParams, CreateWalletParamsBuilder> {
  factory CreateWalletParams([void Function(CreateWalletParamsBuilder) updates]) = _$CreateWalletParams;

  const CreateWalletParams._();

  @BuiltValueHook(initializeBuilder: true)
  static void _setDefaults(CreateWalletParamsBuilder b) => b..id = '';
}

@LazySingleton()
class CreateWalletUseCase with UseCase<CreateWalletParams, Either<OBException, void>> {
  CreateWalletUseCase({required this.repository});

  final WalletManagerRepository repository;

  @override
  Future<Either<OBException, void>> execute(CreateWalletParams params) => repository.createWallet(params);
}
