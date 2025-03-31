part of 'wallet_manager_bloc.dart';

@immutable
abstract class WalletManagerState extends Equatable {}

class WalletManagerInitial extends WalletManagerState {
  @override
  List<Object?> get props => [];
}

class WalletLoadingState extends WalletManagerState {
  WalletLoadingState(this.time);

  final DateTime? time;

  @override
  List<Object?> get props => [time];
}

class WalletLoadSuccessState extends WalletManagerState {
  WalletLoadSuccessState({required this.wallets, this.time});

  final List<TransactionWalletInterface> wallets;
  final DateTime? time;

  @override
  List<Object?> get props => [time];
}

class WalletErrorState extends WalletManagerState {
  WalletErrorState(this.exception);

  final OBException exception;

  @override
  List<Object?> get props => [exception];
}
