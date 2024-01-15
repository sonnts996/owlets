/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

import '../../domain/interfaces/wallet_interface.dart';
import 'wallet_index_model.dart';

part 'wallet_model.g.dart';

abstract class WalletModel implements Built<WalletModel, WalletModelBuilder>, WalletInterface {
  factory WalletModel([void Function(WalletModelBuilder) updates]) = _$WalletModel;

  const WalletModel._();

  @override
  BuiltList<String> get tags;

  @override
  WalletIndexModel get index;
}
