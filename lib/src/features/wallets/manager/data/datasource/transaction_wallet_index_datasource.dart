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
    {
      'id': 1,
      'name': 'Thu nhập',
      'descriptions': 'Các khoản tiền kiếm được như lương, lợi nhuận kinh doanh, đầu tư, được tặng cho, trợ cấp,...',
      'outputIndex': -1,
      'inputIndex': 0,
      'color': '#FF5572a0',
      'iconUrl': 'assets/image/icons/ic3d_money.png',
    },
    {
      'id': 2,
      'name': 'Ví & Tài khoản',
      'descriptions':
      'Các tài khoản lưu giữ, tích luỹ có thể được lấy ra sử dụng bất kỳ lúc nào như ví tiền, tài khoản ngân hàng,...',
      'outputIndex': -1,
      'inputIndex': 1,
      'color': '#FFdac790',
      'iconUrl': 'assets/image/icons/ic3d_wallet.png',
    },
    {
      'id': 3,
      'name': 'Ký gửi & Tiết kiệm',
      'descriptions':
      'Các khoản cất giữ, tiết kiệm cho mục đích lâu dài, khoản cho vay, đầu tư,... có thể lấy lại được nhưng hạn chế.',
      'outputIndex': 1,
      'inputIndex': -1,
      'color': '#FFe87c54',
      'iconUrl': 'assets/image/icons/ic3d_piggy_bank.png',
    },
    {
      'id': 4,
      'name': 'Vay & Tín dụng',
      'descriptions': 'Các khoản vay, credit,... sẽ phải hoàn trả trong tương lai.',
      'outputIndex': 1,
      'inputIndex': -1,
      'color': '#FFb5d664',
      'iconUrl': 'assets/image/icons/ic3d_loan.png'
    },
    {
      'id': 5,
      'name': 'Chi tiêu & Phí',
      'descriptions': 'Các khoản chi tiêu, mua sắp, thuế, phí, đóng góp, quyên góp, tặng cho...',
      'outputIndex': 0,
      'inputIndex': -1,
      'color': '#FFcc6a6a',
      'iconUrl': 'assets/image/icons/ic3d_shopping.png',
    },
  ];

  FutureOr<List<TransactionWalletIndexModel>> getData() async => _data.map(TransactionWalletIndexModel.fromJson).toList();
}
