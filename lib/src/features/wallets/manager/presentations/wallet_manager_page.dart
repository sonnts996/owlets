/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:owlet_router/router.dart';

import '../../../../../application/app.dart';
import '../../../../components/apptooltip.dart';
import '../../../../components/bottom_appbar.dart';
import '../../../../components/ext/contextx.dart';
import '../../../../components/money_text.dart';
import '../../wallet_route.dart';
import '../../widgets/wallet_appbar.dart';
import '../../widgets/wallet_header.dart';
import '../../widgets/wallet_tab.dart';

class WalletManagerPage extends StatefulWidget {
  const WalletManagerPage({super.key});

  @override
  State<WalletManagerPage> createState() => _WalletManagerPageState();
}

class _WalletManagerPageState extends State<WalletManagerPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController = TabController(length: 6, vsync: this);
  final JustTheController _tooltipController = JustTheController();
  final MoneyObscured obscuredNotifier = MoneyObscured();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () => _tooltipController.showTooltip(autoClose: true));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            WalletAppBar(
              tabController: _tabController,
              title: 'Quản lý ví',
              actions: [
                ObscuredIcon(obscuredNotifier: obscuredNotifier),
                8.horizontalSpacing,
              ],
            ),
            SliverToBoxAdapter(
              child: WalletHeader(
                obscuredNotifier: obscuredNotifier,
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              WalletTab(obscuredNotifier: obscuredNotifier, onTab: onWalletTab),
              WalletTab(obscuredNotifier: obscuredNotifier, onTab: onWalletTab),
              WalletTab(obscuredNotifier: obscuredNotifier, onTab: onWalletTab),
              WalletTab(obscuredNotifier: obscuredNotifier, onTab: onWalletTab),
              WalletTab(obscuredNotifier: obscuredNotifier, onTab: onWalletTab),
              WalletTab(obscuredNotifier: obscuredNotifier, onTab: onWalletTab),
            ],
          ),
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: context.decoration.lightBoxShadow,
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
                    'Thêm ví mới',
                    controller: _tooltipController,
                    child: FloatingActionButton.large(
                      onPressed: () async {
                        await OwletApp.service.route.wallet.create.pushNamed();
                      },
                      child: const Icon(CupertinoIcons.plus_rectangle_on_rectangle),
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

  void onWalletTab(String id) {
    RouteBase.of<WalletRoute>(context).detail.pushNamed(args: id);
  }
}
