part of 'wallet_manager_bloc.dart';

@immutable
abstract class WalletManagerEvent {}


class GetWalletListEvent extends WalletManagerEvent{
  GetWalletListEvent();
}