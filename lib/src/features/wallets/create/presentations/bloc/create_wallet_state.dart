part of 'create_wallet_bloc.dart';

@immutable
abstract class CreateWalletState extends Equatable {
  const CreateWalletState();
}

class CreateWalletInitial extends CreateWalletState {
  @override
  List<Object?> get props => [];
}

class CreateWalletErrorState extends CreateWalletState {
  CreateWalletErrorState(this.exception);

  final OBException exception;

  @override
  List<Object?> get props => [exception];
}

class CreateWalletLoadDataSuccessState extends CreateWalletState {
  CreateWalletLoadDataSuccessState({
    required this.walletIndexList,
    required this.walletNameValidator,
  });

  final List<TransactionWalletIndexInterface> walletIndexList;
  final FormFieldValidator<String> walletNameValidator;

  @override
  List<Object?> get props => [walletIndexList, walletNameValidator];
}

class WalletErrorDataState extends CreateWalletState {
  WalletErrorDataState({
    this.walletIndexError,
    this.walletNameError,
  });

  final String? walletIndexError;
  final String? walletNameError;

  @override
  List<Object?> get props => [walletIndexError, walletNameError];
}
