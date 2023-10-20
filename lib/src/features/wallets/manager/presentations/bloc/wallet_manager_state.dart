part of 'wallet_manager_bloc.dart';

@immutable
abstract class WalletManagerState extends Equatable {}

class WalletManagerInitial extends WalletManagerState {
  @override
  List<Object?> get props => [];
}

class WalletLoadSuccessState extends WalletManagerState {
  WalletLoadSuccessState({required this.wallets});

  final List<TransactionWalletInterface> wallets;

  @override
  List<Object?> get props => [wallets];
}
