import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../base/base.dart';
import '../../../../../../base/utilities/bloc_core.dart';
import '../../../shared/interfaces/transaction_wallet_index.dart';
import '../../domain/load_wallet_input_form_usecase.dart';

part 'create_wallet_event.dart';

part 'create_wallet_state.dart';

@LazySingleton()
class CreateWalletBloc extends BlocCore<CreateWalletEvent, CreateWalletState> {
  CreateWalletBloc({required this.loadWalletInputFormUseCase})
      : super(CreateWalletInitial(), blocName: 'CreateWalletBloc') {
    on<CreateWalletLoadDataEvent>(_onCreateWalletLoadData);
  }

  final LoadWalletInputFormUseCase loadWalletInputFormUseCase;

  @disposeMethod
  void dispose() {
    close();
  }

  FutureOr<void> _onCreateWalletLoadData(CreateWalletLoadDataEvent event, Emitter<CreateWalletState> emit) async {
    final result = await loadWalletInputFormUseCase.execute();
    emit(result.fold(CreateWalletErrorState.new, (r) => CreateWalletLoadDataSuccessState(walletIndexList: r)));
  }
}
