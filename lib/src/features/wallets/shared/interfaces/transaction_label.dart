/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

enum TransactionLabelType {
  wallet('wallet'),
  transaction('wallet');

  const TransactionLabelType(this.name);

  final String name;
}

mixin TransactionLabelInterface {
  int get id;

  String get name;

  TransactionLabelType get type;
}
