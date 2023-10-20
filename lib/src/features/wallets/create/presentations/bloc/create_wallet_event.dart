part of 'create_wallet_bloc.dart';

@immutable
abstract class CreateWalletEvent {
  const CreateWalletEvent();
}

class CreateWalletLoadDataEvent extends CreateWalletEvent {
  const CreateWalletLoadDataEvent();
}

class SummitCreateWalletEvent extends CreateWalletEvent {
  SummitCreateWalletEvent({
    required this.walletName,
    required this.descriptions,
    required this.index,
    required this.label,
  });

  final String walletName;
  final String descriptions;
  final TransactionWalletIndexInterface? index;
  final Set<String> label;
}
