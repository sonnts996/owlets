/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../../../shared/interfaces/transaction_wallet_index.dart';

part 'transaction_wallet_index_model.g.dart';

@SerializersFor([TransactionWalletIndexModel])
final Serializers _serializers = (_$_serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

abstract class TransactionWalletIndexModel
    with TransactionWalletIndexInterface
    implements Built<TransactionWalletIndexModel, TransactionWalletIndexModelBuilder> {
  factory TransactionWalletIndexModel([void Function(TransactionWalletIndexModelBuilder) updates]) =
      _$TransactionWalletIndexModel;

  const TransactionWalletIndexModel._();

  static TransactionWalletIndexModel fromJson(Map<String, dynamic> json) =>
      _serializers.deserializeWith(TransactionWalletIndexModel.serializer, json)!;

  Map<String, dynamic> toJson() =>
      _serializers.serializeWith(TransactionWalletIndexModel.serializer, this) as Map<String, dynamic>;

  static Serializer<TransactionWalletIndexModel> get serializer => _$transactionWalletIndexModelSerializer;
}
