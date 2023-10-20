import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../shared/interfaces/transaction_wallet_index.dart';
import '../../domain/create_wallet_usecase.dart';
import '../../domain/load_wallet_input_form_usecase.dart';

part 'create_wallet_event.dart';

part 'create_wallet_state.dart';

@injectable
class CreateWalletBloc extends BlocCore<CreateWalletEvent, CreateWalletState> {
  @factoryMethod
  CreateWalletBloc({required this.loadWalletInputFormUseCase, required this.createWalletUseCase})
      : super(CreateWalletInitial(), blocName: 'CreateWalletBloc') {
    on<CreateWalletLoadDataEvent>(_onCreateWalletLoadData);
    on<SummitCreateWalletEvent>(_onSummitCreateWallet);
  }

  final LoadWalletInputFormUseCase loadWalletInputFormUseCase;
  final CreateWalletUseCase createWalletUseCase;

  FutureOr<void> _onCreateWalletLoadData(CreateWalletLoadDataEvent event, Emitter<CreateWalletState> emit) async {
    final result = await loadWalletInputFormUseCase.execute();
    emit(result.fold(
        CreateWalletErrorState.new,
        (r) => CreateWalletLoadDataSuccessState(
              walletIndexList: r,
              walletNameValidator: (value) {
                if (value?.isEmpty == true) return "Please type wallet's name";
                return null;
              },
            )));
  }

  FutureOr<void> _onSummitCreateWallet(SummitCreateWalletEvent event, Emitter<CreateWalletState> emit) async {
    if (event.index == null || event.walletName.isEmpty) {
      emit(WalletErrorDataState(
          walletIndexError: event.index?.let((it) => null) ?? 'Please choose wallet type',
          walletNameError: event.walletName.isEmpty ? "Please type wallet's name" : null));
    } else {
      final result = await createWalletUseCase(CreateWalletParams(
        (p0) => p0
          ..name = event.walletName
          ..label = event.label.toList()
          ..descriptions = event.descriptions
          ..walletIndex = event.index,
      ));
      result.fold(print, (r) => null);
    }
  }
}
