/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'dart:async';

import 'package:injectable/injectable.dart';

import '../model/transaction_wallet_index_model.dart';

@LazySingleton()
class TransactionWalletIndexDatasource {
  const TransactionWalletIndexDatasource();

  final _data = const [
    {'id': 1, 'name': 'Thu nhập', 'outputIndex': -1, 'inputIndex': 0},
    {'id': 2, 'name': 'Tài khoản', 'outputIndex': -1, 'inputIndex': 1},
    {'id': 3, 'name': 'Ký gửi', 'outputIndex': 1, 'inputIndex': -1},
    {'id': 4, 'name': 'Tín dụng', 'outputIndex': 1, 'inputIndex': -1},
    {'id': 5, 'name': 'Chi tiêu', 'outputIndex': 0, 'inputIndex': -1},
  ];

  FutureOr<List<TransactionWalletIndexModel>> getData() => _data.map(TransactionWalletIndexModel.fromJson).toList();
}
