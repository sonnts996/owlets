/*
 Created by Thanh Son on 05/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

enum WalletIndexType {
  income(1),
  expense(-1),
  none(0);

  const WalletIndexType(this.value);

  static WalletIndexType of(int value) {
    if (value > 0) {
      return WalletIndexType.income;
    } else if (value < 0) {
      return WalletIndexType.expense;
    }
    return WalletIndexType.none;
  }

  final int value;
}