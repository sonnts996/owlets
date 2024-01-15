/*
 Created by Thanh Son on 27/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../components/app_back_leading.dart';
import '../../../../components/appbar_title.dart';
import '../../../../components/apptooltip.dart';
import '../../../../components/bottom_appbar.dart';
import '../../../../components/ext/contextx.dart';
import '../../../../components/money_text.dart';
import '../../../../helper/formatterx.dart';
import '../../widgets/wallet_button.dart';

class WalletDetailPage extends StatefulWidget {
  const WalletDetailPage({
    super.key,
    this.id = '',
  });

  final String id;

  @override
  State<WalletDetailPage> createState() => _WalletDetailPageState();
}

class _WalletDetailPageState extends State<WalletDetailPage> {
  final JustTheController _tooltipController = JustTheController();
  final MoneyObscured _obscuredNotifier = MoneyObscured();

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              leading: const AppBackLeading(),
              title: const AppbarTitle('Tiền mặt'),
              systemOverlayStyle: context.theme.appBarTheme.systemOverlayStyle,
              actions: [
                ObscuredIcon(obscuredNotifier: _obscuredNotifier),
                8.horizontalSpacing,
              ],
            ),
          ],
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 16),
            separatorBuilder: (context, index) => const SizedBox(height: 1),
            itemCount: 11,
            itemBuilder: (context, index) {
              if (index == 10) {
                return SafeArea(
                  top: false,
                  child: Container(alignment: Alignment.center, height: 48, child: const Text('End Of List')),
                );
              }
              final date = DateTime.now().subtract(Duration(days: index));
              if (index == 0 || (index % 3 == 0 && index.isOdd)) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                      child: Text(
                        AppFormatter.dateFormat(context, date),
                        style: context.textTheme.titleMedium?.apply(fontWeightDelta: 2),
                      ),
                    ),
                    TransactionItem(obscuredNotifier: _obscuredNotifier, datetime: date),
                  ],
                );
              }
              return TransactionItem(obscuredNotifier: _obscuredNotifier, datetime: date);
            },
          ),
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow:context.decoration.lightBoxShadow,
          ),
          child: BottomAppBar(
            notchMargin: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: BottomAppbarItem(
                    icon: Icon(CupertinoIcons.slider_horizontal_3),
                    label: 'Lọc',
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.loose,
                  child: AppTooltip.content(
                    'Thêm vào ví',
                    controller: _tooltipController,
                    child: FloatingActionButton.large(
                      child: const Icon(CupertinoIcons.add),
                      onPressed: () {
                        _tooltipController.showTooltip(autoClose: true);
                      },
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: BottomAppbarItem(
                    icon: Icon(CupertinoIcons.chart_pie),
                    label: 'Báo cáo',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.obscuredNotifier,
    required this.datetime,
    super.key,
  });

  final MoneyObscured obscuredNotifier;
  final DateTime datetime;

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: context.theme.cardColor,
          border: const Border(
            left: BorderSide(color: Colors.greenAccent, width: 5),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    WalletButton(
                      name: 'Lương',
                      color: Colors.amber,
                      onTab: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(CupertinoIcons.chevron_right, size: 14, color: context.displayColor),
                    ),
                    WalletButton(
                      name: 'Tiền mặt',
                      color: Colors.blueAccent,
                      onTab: () {},
                    ),
                  ],
                ),
                const Spacer(),
                MoneyText(
                  102000,
                  currency: 'VND',
                  obscuredNotifier: obscuredNotifier,
                  canToggleObscurity: false,
                  textStyle: MoneyTextStyle.medium,
                ),
              ],
            ),
            8.verticalSpacing,
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.start,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  AppFormatter.timeFormat(context, datetime),
                  style: context.textTheme.labelMedium?.apply(color: context.displayColor.withOpacity(0.8)),
                ),
                16.horizontalSpacing,
                Expanded(
                  child: Text(
                    loremIpsum(words: 250),
                    style: context.textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
