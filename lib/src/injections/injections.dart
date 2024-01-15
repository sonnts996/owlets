/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../components/money_text.dart';
import 'injections.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<void> configureDependencies() async {
  getIt.init();
  await getIt.getAsync<GlobalMoneyObscured>();
}
