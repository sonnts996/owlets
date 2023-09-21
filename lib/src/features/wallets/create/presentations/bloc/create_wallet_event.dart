part of 'create_wallet_bloc.dart';

@immutable
abstract class CreateWalletEvent {
  const CreateWalletEvent();
}

class CreateWalletLoadDataEvent extends CreateWalletEvent{
  const CreateWalletLoadDataEvent();
}