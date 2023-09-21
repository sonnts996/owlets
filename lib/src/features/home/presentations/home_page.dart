/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:rowlet/rowlet.dart';

import '../../../../application/owlet_app_global_provider.dart';
import '../../../../base/base.dart';
import 'components/floating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => Scaffold(
      floatingActionButton: FloatingBar(
        mainScrollController: _scrollController,
        initialWidth: MediaQuery.of(context).size.width - 64,
        onTab: () {
          OwletAppGlobal.routesInst.wallet.create.pushNamed(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(flexibleSpace: FlexibleSpaceBar(title: AppBarTitle('Hello'))),
        ],
        body: Center(
            child: Padding(
          padding: 16.allInsets,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text('What is Lorem Ipsum?', style: context.theme.textTheme.headlineLarge),
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ]),
        )),
      ));
}
