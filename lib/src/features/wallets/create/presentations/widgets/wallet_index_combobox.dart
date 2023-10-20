/*
 Created by Thanh Son on 30/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:flutter/cupertino.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../../../application/owlet_app_global_provider.dart';
import '../../../../../../base/shared.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../shared.dart';
import '../../shared.dart';

class WalletIndexComboBox extends StatelessWidget {
  const WalletIndexComboBox({
    super.key,
    required InternalValueGetter<TransactionWalletIndexInterface?> walletIndexGetter,
    this.errorText,
    required this.walletIndexList,
  }) : _walletIndexGetter = walletIndexGetter;

  final InternalValueGetter<TransactionWalletIndexInterface?> _walletIndexGetter;
  final String? errorText;
  final List<TransactionWalletIndexInterface> walletIndexList;

  bool get shouldShowError => errorText?.isNotEmpty == true;

  @override
  Widget build(BuildContext context) => AppComboBox<TransactionWalletIndexInterface>(
      valueGetter: _walletIndexGetter,
      nothingBuilder: (context, focusNode) => Padding(
          padding: shouldShowError ? EdgeInsets.zero : EdgeInsets.only(bottom: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ComboBoxLabelTile(
                  focusNode: focusNode,
                  isError: errorText != null,
                  label: context.l10n.walletType,
                  child: AppDisplay(context.l10n.selectOne)),
              if (shouldShowError) ErrorTextTile(errorText: errorText),
            ],
          )),
      selectedBuilder: (context, value, focusNode) => Column(mainAxisSize: MainAxisSize.min, children: [
            ComboBoxTile(
                focusNode: focusNode,
                child: SelectableIconTextTile(
                    label: value.name,
                    padding: EdgeInsets.fromLTRB(0, 8, 16, 8),
                    icon: BoxIcon(
                      child: AssetGenImage(value.iconUrl).image(),
                      size: 32,
                      inset: 2,
                      backgroundColor: context.scheme.surface,
                    ))),
            IconTextTile(prefixIcon: Icon(CupertinoIcons.info_circle, size: 16), child: AppCaption(value.descriptions)),
          ]),
      onTab: (context, controller) => OwletAppGlobal.routesInst.wallet.create.walletIndexPopup.pushNamed(context,
          args: WalletIndexPopupParams(
            walletIndexList: walletIndexList,
            controller: controller,
          )));
}
