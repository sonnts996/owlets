/*
 Created by Thanh Son on 18/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:owlet_router/router.dart';

import '../../../../application/app.dart';
import '../../../../gen/assets/assets.gen.dart';
import '../../../components/apptooltip.dart';
import '../../../components/ext/contextx.dart';
import '../../../theme/app_theme.dart';
import 'widgets/home_appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final JustTheController controller = JustTheController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 1), () => controller.showTooltip(autoClose: true));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              pinned: false,
              floating: true,
              snap: true,
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: Text.rich(
                  TextSpan(
                    text: 'Chào ',
                    children: [
                      TextSpan(
                        text: 'Owlet,',
                        style: context.textTheme.titleLarge?.apply(color: OwletApp.appTheme.appSchemes.displayColor),
                      ),
                      TextSpan(text: '\nHôm nay bạn thế nào?', style: context.textTheme.titleMedium),
                    ],
                  ),
                  style: context.textTheme.titleLarge,
                ),
                titlePadding: const EdgeInsets.all(16),
                centerTitle: false,
              ),
            ),
          ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Assets.images.owletEgg.lottie(height: 300),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AppTooltip.content(
          'Đừng quên cập nhật chi tiêu của bạn ngày hôm nay nhé!',
          controller: controller,
          child: FloatingActionButton(
            child: const Icon(CupertinoIcons.add),
            onPressed: () {
              controller.showTooltip(autoClose: true);
              Navigator.of(context).pushNamed(OwletApp.service.route.foundation.loading.path);
            },
          ),
        ),
        bottomNavigationBar: HomeAppBar(
          currentIndex: -1, // BottomItem mở trang khi nên không có selected
          onTab: (value) {
            switch (value) {
              case 0:
                OwletApp.service.route.wallet.manager.pushNamed();
            }
          },
        ),
      );
}
