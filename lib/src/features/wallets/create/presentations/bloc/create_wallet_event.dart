part of 'create_wallet_bloc.dart';

@immutable
abstract class CreateWalletEvent {
  const CreateWalletEvent();
}

class CreateWalletLoadDataEvent extends CreateWalletEvent {
  const CreateWalletLoadDataEvent();
}

class SummitCreateWalletEvent extends CreateWalletEvent {
  const SummitCreateWalletEvent({
    required this.walletName,
    required this.descriptions,
    required this.index,
    required this.label,
    required this.color,
  });

  final String walletName;
  final String descriptions;
  final TransactionWalletIndexInterface? index;
  final Set<String> label;
  final Color color;
}

class CreateWalletResetEvent extends CreateWalletEvent{
  const CreateWalletResetEvent();
}
