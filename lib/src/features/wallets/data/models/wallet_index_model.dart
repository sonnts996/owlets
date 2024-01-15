/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'package:built_value/built_value.dart';

import '../../domain/enum/wallet_index.dart';
import '../../domain/interfaces/wallet_index_interface.dart';

part 'wallet_index_model.g.dart';

abstract class WalletIndexModel implements Built<WalletIndexModel, WalletIndexModelBuilder>, WalletIndexInterface {

  factory WalletIndexModel([void Function(WalletIndexModelBuilder) updates]) = _$WalletIndexModel;

  const WalletIndexModel._();

  @BuiltValue(wireName: 'type')
  int get walletType;

  @override
  WalletIndexType get type => WalletIndexType.of(walletType);
}
