/*
 Created by Thanh Son on 21/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:dartz/dartz.dart';

import '../../../../../base/base.dart';
import '../../wallets.dart';

abstract class WalletManagerRepository {
  Future<Either<OBException, List<TransactionWalletIndexInterface>>> getWalletIndex();
}
