/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../application/owlet_app_global_provider.dart';
import '../../../../base/shared.dart';
import 'components/floating_bar.dart';
import 'components/menus/create_wallet_menu.dart';
import 'components/menus/manage_wallet_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      floatingActionButton: FloatingBar(
        mainScrollController: _scrollController,
        initialWidth: MediaQuery.of(context).size.width - 64,
        onTab: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  surfaceTintColor: context.scheme.background,
                  title: AppBarTitle('WOwlet'),
                  centerTitle: true,
                  pinned: true,
                  titleSpacing: 16,
                ),
              ],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGrid.count(
              crossAxisCount: 4,
              children: [
                ManageWalletMenu(onTab: () {
                  OwletAppGlobal.routesInst.wallet.manager.pushNamed(context);
                }),
                CreateWalletMenu(onTab: () {
                  OwletAppGlobal.routesInst.wallet.create.pushNamed(context);
                }),
              ],
            ),
          )));
}