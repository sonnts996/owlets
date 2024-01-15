/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:flutter/material.dart';

import '../../../components/app_back_leading.dart';
import '../../../components/appbar_title.dart';
import '../../../components/ext/contextx.dart';

class WalletAppBar extends StatelessWidget {
  const WalletAppBar({
    required this.tabController,
    this.title = '',
    this.actions = const [],
    super.key,
  });

  final TabController tabController;

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => SliverAppBar(
    pinned: true,
    floating: true,
    snap: true,
    elevation: 10,
    systemOverlayStyle: context.theme.appBarTheme.systemOverlayStyle,
    title: AppbarTitle(title),
    leading: const AppBackLeading(),
    shadowColor: context.scheme.shadow,
    actions: actions,
    bottom: WalletTabBar(
      tabController: tabController,
    ),
  );
}

class WalletTabBar extends StatelessWidget implements PreferredSizeWidget {
  const WalletTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) => TabBar(
    controller: tabController,
    isScrollable: true,
    indicatorSize: TabBarIndicatorSize.tab,
    tabAlignment: TabAlignment.start,
    dividerColor: Colors.transparent,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    indicator: _DropWaterIndicator(
      indicatorColor: context.scheme.inverseSurface,
    ),
    splashFactory: NoSplash.splashFactory,
    labelColor: Colors.white,
    unselectedLabelColor: context.displayColor,
    labelStyle: context.textTheme.bodyMedium?.apply(fontWeightDelta: 2),
    tabs: [
      Tab(text: 'Thu nhập'.toUpperCase()),
      Tab(text: 'Tài khoản'.toUpperCase()),
      Tab(text: 'Chi tiêu'.toUpperCase()),
      Tab(text: 'Tín dụng'.toUpperCase()),
      Tab(text: 'Ký gửi'.toUpperCase()),
      Tab(text: 'Khác'.toUpperCase()),
    ],
  );

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _DropWaterIndicator extends Decoration {
  const _DropWaterIndicator({required this.indicatorColor});

  final Color indicatorColor;

  @override
  _DropWaterPainter createBoxPainter([VoidCallback? onChanged]) => _DropWaterPainter(indicatorColor, onChanged);
}

class _DropWaterPainter extends BoxPainter {
  _DropWaterPainter(this.indicatorColor, super.onChanged);

  final Color indicatorColor;

  double middle(double a, double b) => (a + b) / 2;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final rect = Rect.fromLTWH(
      offset.dx,
      offset.dy + 5,
      configuration.size!.width,
      configuration.size!.height - 14,
    );

    final path = Path();
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(16));
    path.addRRect(rrect);

    final paint = Paint();
    paint.color = indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }
}
