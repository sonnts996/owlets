/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

mixin TransactionWalletIndexInterface {
  int get id;

  String get name;

  int get outputIndex;

  int get inputIndex;
}
