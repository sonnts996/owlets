import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../shared.dart';
import '../../domain/load_wallet_list_usecase.dart';

part 'wallet_manager_event.dart';
part 'wallet_manager_state.dart';

@injectable
class WalletManagerBloc extends BlocCore<WalletManagerEvent, WalletManagerState> {
  @factoryMethod
  WalletManagerBloc({required this.loadWalletListUseCase}) : super(WalletManagerInitial()) {
    on<GetWalletListEvent>(_onGetWalletList);
  }

  final LoadWalletListUseCase loadWalletListUseCase;

  FutureOr<void> _onGetWalletList(GetWalletListEvent event, Emitter<WalletManagerState> emit) async {
    emit(WalletLoadingState(DateTime.now()));
    final result = await loadWalletListUseCase();
    result.fold(
      (l) => emit(WalletErrorState(l)),
      (r) => emit(WalletLoadSuccessState(wallets: r, time: DateTime.now())),
    );
  }
}
