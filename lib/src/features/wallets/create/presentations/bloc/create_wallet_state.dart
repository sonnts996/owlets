part of 'create_wallet_bloc.dart';

@immutable
abstract class CreateWalletState {
  const CreateWalletState();
}

class CreateWalletInitial extends CreateWalletState {}

class CreateWalletErrorState extends CreateWalletState {
  CreateWalletErrorState(this.exception);

  final OBException exception;
}

class CreateWalletLoadDataSuccessState extends CreateWalletState {
  CreateWalletLoadDataSuccessState({required this.walletIndexList});

  final List<TransactionWalletIndexInterface> walletIndexList;
}
