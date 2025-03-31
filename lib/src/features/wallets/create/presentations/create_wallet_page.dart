/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../base/components/app_color_picker.dart';
import '../../../../../base/shared.dart';
import '../../shared/interfaces/transaction_wallet_index.dart';
import 'bloc/create_wallet_bloc.dart';
import 'widgets/wallet_index_combobox.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({
    required this.createWalletBloc,
    super.key,
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
  final SelectedController<Color> _colorController = SelectedController(Colors.grey);

  @override
  void initState() {
    super.initState();
    widget.createWalletBloc.add(const CreateWalletLoadDataEvent());
  }

  @override
  void dispose() {
    widget.createWalletBloc.add(const CreateWalletResetEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppDraggableBottomSheet(
      background: context.scheme.background,
      expand: true,
      title: 'Create Wallet',
      hasTitle: true,
      builder: (context, scrollController) => GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            behavior: HitTestBehavior.opaque,
            child: BlocListener<CreateWalletBloc, CreateWalletState>(
              listener: (context, state) {
                if (state is CreateWalletErrorState) {
                  AppToast.showError(state.exception);
                } else if (state is CreateWalletDoneDataState) {
                  Navigator.pop(context, state.wallet);
                }
              },
              child: BlocBuilder<CreateWalletBloc, CreateWalletState>(
                buildWhen: (previous, current) => current is CreateWalletLoadDataSuccessState,
                builder: (context, state) {
                  if (state is CreateWalletLoadDataSuccessState) {
                    return SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller: scrollController,
                      padding: 16.horizontalTopInsets,
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        BlocBuilder<CreateWalletBloc, CreateWalletState>(
                            buildWhen: (previous, current) => current is CreateWalletErrorDataState,
                            builder: (context, errorState) =>
                                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  ValueListenableBuilder<Color>(
                                    valueListenable: _colorController,
                                    builder: (context, value, child) => Container(
                                      width: 4,
                                      height: 40,
                                      decoration: BoxDecoration(color: value, borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                  8.horizontalSpacing,
                                  Expanded(
                                      child: AppFlatTextField(
                                    hint: "Type your wallet's name...",
                                    textFactor: 1.25,
                                    valueGetter: _walletNameGetter,
                                    formValidator: state.walletNameValidator,
                                    errorText: errorState.castTo<CreateWalletErrorDataState?>()?.walletNameError,
                                  )),
                                ])),
                        16.verticalSpacing,
                        BlocBuilder<CreateWalletBloc, CreateWalletState>(
                          buildWhen: (previous, current) => current is CreateWalletErrorDataState,
                          builder: (context, errorState) => WalletIndexComboBox(
                              walletIndexGetter: _walletIndexGetter,
                              walletIndexList: state.walletIndexList,
                              errorText: errorState.castTo<CreateWalletErrorDataState?>()?.walletIndexError),
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
                        16.verticalSpacing,
                        AppColorPicker(controller: _colorController),
                        16.verticalSpacing,
                        SafeArea(
                            child: Padding(
                          padding: 16.bottomInsets,
                          child: AppPrimaryButton(
                            margin: 16.topInsets,
                            text: 'Create Wallet',
                            onTab: () {
                              widget.createWalletBloc.add(SummitCreateWalletEvent(
                                walletName: _walletNameGetter(),
                                descriptions: _descriptionGetter(),
                                index: _walletIndexGetter(),
                                label: _labelsGetter(),
                                color: _colorController.value,
                              ));
                            },
                          ),
                        )),
                      ]),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ));
}
