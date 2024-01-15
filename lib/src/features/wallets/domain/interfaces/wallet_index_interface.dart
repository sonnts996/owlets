/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import '../enum/wallet_index.dart';

abstract class WalletIndexInterface {
    WalletIndexType get type;

    String get name;

    String get icon;
}
