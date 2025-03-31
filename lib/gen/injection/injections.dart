/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injections.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

extension GetItX on GetIt {
  void registerFactoryIfNotExist<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
  }) {
    if (!isRegistered<T>(instanceName: instanceName)) {
      registerFactory(factoryFunc, instanceName: instanceName);
    }
  }

  void registerLazySingletonIfNotExist<T extends Object>(
    FactoryFunc<T> factoryFunc, {
    String? instanceName,
    DisposingFunc<T>? dispose,
  }) {
    if (!isRegistered<T>(instanceName: instanceName)) {
      registerLazySingleton(factoryFunc, instanceName: instanceName);
    }
  }
}
