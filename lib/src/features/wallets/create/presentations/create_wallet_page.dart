/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../base/shared.dart';
import '../../shared/interfaces/transaction_wallet_index.dart';
import 'bloc/create_wallet_bloc.dart';
import 'widgets/wallet_index_combobox.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({
    super.key,
    required this.createWalletBloc,
  });

  final CreateWalletBloc createWalletBloc;

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  final InternalValueGetter<String> _descriptionGetter = InternalValueGetter.defaultValue('');
  final InternalValueGetter<String> _walletNameGetter = InternalValueGetter.defaultValue('');
  final InternalValueGetter<Set<String>> _labelsGetter = InternalValueGetter.defaultValue({});
  final InternalValueGetter<TransactionWalletIndexInterface?> _walletIndexGetter = InternalValueGetter();

  @override
  void initState() {
    super.initState();
    widget.createWalletBloc.add(const CreateWalletLoadDataEvent());
  }

  @override
  Widget build(BuildContext context) => AppBottomSheet(
      background: context.scheme.background,
      hasTitle: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: BlocBuilder<CreateWalletBloc, CreateWalletState>(
          buildWhen: (previous, current) => current is CreateWalletLoadDataSuccessState,
          builder: (context, state) {
            if (state is CreateWalletLoadDataSuccessState) {
              return Padding(
                padding: 16.horizontalTopInsets,
                child: SingleChildScrollView(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    BlocBuilder<CreateWalletBloc, CreateWalletState>(
                        buildWhen: (previous, current) => current is WalletErrorDataState,
                        builder: (context, errorState) => AppFlatTextField(
                              hint: "Type your wallet's name...",
                              textFactor: 1.25,
                              valueGetter: _walletNameGetter,
                              formValidator: state.walletNameValidator,
                              errorText: errorState.castTo<WalletErrorDataState?>()?.walletNameError,
                            )),
                    16.verticalSpacing,
                    BlocBuilder<CreateWalletBloc, CreateWalletState>(
                      buildWhen: (previous, current) => current is WalletErrorDataState,
                      builder: (context, errorState) => WalletIndexComboBox(
                          walletIndexGetter: _walletIndexGetter,
                          walletIndexList: state.walletIndexList,
                          errorText: errorState.castTo<WalletErrorDataState?>()?.walletIndexError),
                    ),
                    AppTextField(
                      hint: 'Type something about your wallet...',
                      label: 'Descriptions:',
                      maxLines: 3,
                      valueGetter: _descriptionGetter,
                    ),
                    16.verticalSpacing,
                    AppChipTextField(
                      label: 'Labels:',
                      hint: 'Separate by ","',
                      valueGetter: _labelsGetter,
                    ),
                    Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: AppPrimaryButton(
                        margin: 16.topInsets,
                        text: 'Create Wallet',
                        onTab: () {
                          widget.createWalletBloc.add(SummitCreateWalletEvent(
                              walletName: _walletNameGetter(),
                              descriptions: _descriptionGetter(),
                              index: _walletIndexGetter(),
                              label: _labelsGetter()));
                        },
                      ),
                    )
                  ]),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ));
}
