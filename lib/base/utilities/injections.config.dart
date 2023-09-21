// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/features/wallets/create/domain/load_wallet_input_form_usecase.dart'
    as _i6;
import '../../src/features/wallets/create/presentations/bloc/create_wallet_bloc.dart'
    as _i8;
import '../../src/features/wallets/manager/data/datasource/transaction_wallet_index_datasource.dart'
    as _i3;
import '../../src/features/wallets/manager/data/wallet_manager_repository_impl.dart'
    as _i5;
import '../../src/features/wallets/shared/domain/wallet_manager_repository.dart'
    as _i4;
import '../../src/features/wallets/wallets.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.TransactionWalletIndexDatasource>(
        () => const _i3.TransactionWalletIndexDatasource());
    gh.lazySingleton<_i4.WalletManagerRepository>(() =>
        _i5.WalletManagerRepositoryImpl(
            walletIndexDatasource: gh<_i3.TransactionWalletIndexDatasource>()));
    gh.lazySingleton<_i6.LoadWalletInputFormUseCase>(() =>
        _i6.LoadWalletInputFormUseCase(
            repository: gh<_i7.WalletManagerRepository>()));
    gh.lazySingleton<_i8.CreateWalletBloc>(
      () => _i8.CreateWalletBloc(
          loadWalletInputFormUseCase: gh<_i6.LoadWalletInputFormUseCase>()),
      dispose: (i) => i.dispose(),
    );
    return this;
  }
}
