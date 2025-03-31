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
  const CreateWalletErrorState(this.exception);

  final OBException exception;

  @override
  List<Object?> get props => [exception];
}

class CreateWalletLoadDataSuccessState extends CreateWalletState {
  const CreateWalletLoadDataSuccessState({
    required this.walletIndexList,
    required this.walletNameValidator,
  });

  final List<TransactionWalletIndexInterface> walletIndexList;
  final FormFieldValidator<String> walletNameValidator;

  @override
  List<Object?> get props => [walletIndexList, walletNameValidator];
}

class CreateWalletErrorDataState extends CreateWalletState {
  const CreateWalletErrorDataState({
    this.walletIndexError,
    this.walletNameError,
  });

  final String? walletIndexError;
  final String? walletNameError;

  @override
  List<Object?> get props => [walletIndexError, walletNameError];
}

class CreateWalletDoneDataState extends CreateWalletState {
  const CreateWalletDoneDataState(this.wallet);

  final TransactionWalletInterface wallet;

  @override
  List<Object?> get props => [wallet];
}
