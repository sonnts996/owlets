import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../shared.dart';
import '../../domain/load_wallet_list_usecase.dart';

part 'wallet_manager_event.dart';

part 'wallet_manager_state.dart';

@injectable
class WalletManagerBloc extends Bloc<WalletManagerEvent, WalletManagerState> {
  @factoryMethod
  WalletManagerBloc({required this.loadWalletListUseCase}) : super(WalletManagerInitial()) {
    on<GetWalletListEvent>(_onGetWalletList);
  }

  final LoadWalletListUseCase loadWalletListUseCase;

  FutureOr<void> _onGetWalletList(GetWalletListEvent event, Emitter<WalletManagerState> emit) async {
    final result = await loadWalletListUseCase();
    result.fold(print, (r) => emit(WalletLoadSuccessState(wallets: r)));
  }
}
