/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

enum WalletIndexType {
  income(1),
  expense(-1),
  none(0);

  const WalletIndexType(this.value);

  static of(int value) {
    if (value > 0) {
      return WalletIndexType.income;
    } else if (value < 0) {
      return WalletIndexType.expense;
    }
    return WalletIndexType.none;
  }

  final int value;
}

mixin TransactionWalletIndexInterface {
  int get id;

  String get name;

  int get outputIndex;

  int get inputIndex;

  int get color;

  String get descriptions;

  String get iconUrl;

  WalletIndexType get outputType =>WalletIndexType.of(outputIndex);

  WalletIndexType get inputType =>WalletIndexType.of(inputIndex);
}
