/*
 Created by Thanh Son on 10/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../components/ext/contextx.dart';
import '../../../components/overlay_options.dart';
import '../../../components/textfield_custom_components.dart';
import '../domain/enum/wallet_index.dart';

class WalletCategoriesSelector extends StatefulHookWidget {
  WalletCategoriesSelector({
    required this.onSummit,
    super.key,
    this.focusNode,
    GlobalKey<OverlayOptionsState>? autoCompleteKey,
  }) : autoCompleteKey = autoCompleteKey ?? GlobalKey<OverlayOptionsState>(debugLabel: '_hashTagAutoCompleteKey');

  final GlobalKey<OverlayOptionsState> autoCompleteKey;
  final FocusNode? focusNode;

  final VoidCallback onSummit;

  @override
  State<StatefulWidget> createState() => WalletIndexWidgetState();
}

class WalletIndexWidgetState extends State<WalletCategoriesSelector> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final walletIndex = useState(WalletIndexType.none);
    return FocusBuilder(
      focusNode: widget.focusNode,
      builder: (context, focusNode) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: OverlayOptions(
          key: widget.autoCompleteKey,
          focusNode: focusNode,
          overlay: Scrollbar(
            thumbVisibility: true,
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: WalletIndexType.values
                    .map(
                      (e) => InkWell(
                        onTap: () {
                          walletIndex.value = e;
                          widget.autoCompleteKey.currentState?.close();
                          widget.onSummit();
                        },
                        child: Ink(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          decoration: BoxDecoration(
                            color: WalletIndexType.values.indexOf(e).isOdd
                                ? context.scheme.surfaceVariant
                                : Colors.transparent,
                          ),
                          child: Text(e.name),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          child: Focus(
            focusNode: focusNode,
            child: GestureDetector(
              onTap: () {
                focusNode.requestFocus();
                widget.autoCompleteKey.currentState?.show();
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: context.theme.inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(16),
                  border: focusNode.hasFocus
                      ? Border.fromBorderSide(context.theme.inputDecorationTheme.focusedBorder!.borderSide)
                      : null,
                ),
                child: Text(walletIndex.value.name, style: context.textTheme.bodyLarge),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
