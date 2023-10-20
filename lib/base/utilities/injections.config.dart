// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../src/features/wallets/create/domain/create_wallet_usecase.dart'
    as _i8;
import '../../src/features/wallets/create/domain/load_wallet_input_form_usecase.dart'
    as _i10;
import '../../src/features/wallets/create/presentations/bloc/create_wallet_bloc.dart'
    as _i13;
import '../../src/features/wallets/manager/data/datasource/transaction_wallet_index_datasource.dart'
    as _i4;
import '../../src/features/wallets/manager/data/realm/transaction_wallet_realm.dart'
    as _i5;
import '../../src/features/wallets/manager/data/wallet_manager_repository_impl.dart'
    as _i7;
import '../../src/features/wallets/manager/domain/load_wallet_list_usecase.dart'
    as _i11;
import '../../src/features/wallets/manager/presentations/bloc/wallet_manager_bloc.dart'
    as _i12;
import '../../src/features/wallets/shared.dart' as _i9;
import '../../src/features/wallets/shared/domain/wallet_manager_repository.dart'
    as _i6;
import '../components/app_toast.dart' as _i3;

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
    gh.factory<_i3.AppToast>(() => _i3.AppToast.create());
    gh.lazySingleton<_i4.TransactionWalletIndexDatasource>(
        () => const _i4.TransactionWalletIndexDatasource());
    gh.lazySingleton<_i5.TransactionWalletRealm>(
      () => _i5.TransactionWalletRealm(),
      dispose: (i) => i.close(),
    );
    gh.lazySingleton<_i6.WalletManagerRepository>(
        () => _i7.WalletManagerRepositoryImpl(
              walletIndexDatasource: gh<_i4.TransactionWalletIndexDatasource>(),
              walletRealm: gh<_i5.TransactionWalletRealm>(),
            ));
    gh.lazySingleton<_i8.CreateWalletUseCase>(() =>
        _i8.CreateWalletUseCase(repository: gh<_i9.WalletManagerRepository>()));
    gh.lazySingleton<_i10.LoadWalletInputFormUseCase>(() =>
        _i10.LoadWalletInputFormUseCase(
            repository: gh<_i9.WalletManagerRepository>()));
    gh.lazySingleton<_i11.LoadWalletListUseCase>(() =>
        _i11.LoadWalletListUseCase(
            repository: gh<_i9.WalletManagerRepository>()));
    gh.factory<_i12.WalletManagerBloc>(() => _i12.WalletManagerBloc(
        loadWalletListUseCase: gh<_i11.LoadWalletListUseCase>()));
    gh.factory<_i13.CreateWalletBloc>(() => _i13.CreateWalletBloc(
          loadWalletInputFormUseCase: gh<_i10.LoadWalletInputFormUseCase>(),
          createWalletUseCase: gh<_i8.CreateWalletUseCase>(),
        ));
    return this;
  }
}
