/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../base/base.dart';
import '../../../../../base/components/app_textfields.dart';
import '../../manager/data/datasource/transaction_wallet_index_datasource.dart';
import 'bloc/create_wallet_bloc.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({super.key});

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  @override
  void initState() {
    super.initState();
    test();
  }

  void test() async {
    final test = TransactionWalletIndexDatasource();
    final rs = await test.getData();
    final a = rs.map((e) => e.toJson());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TitleAppBar(
          title: context.l10n.createWalletTitle,
        ),
        body: BlocBuilder<CreateWalletBloc, CreateWalletState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: 16.allInsets,
              child: Column(children: [
                AppFormTextField(
                  hint: 'Type somethings',
                  label: 'Text',
                ),
                16.verticalSpacing,
                AppFormTextField(
                  hint: 'Type somethings',
                  formValidator: (value) => value?.let((it) => it.isEmpty ? 'Please type something.' : null),
                ),
              ]),
            );
          },
        ),
      );
}
