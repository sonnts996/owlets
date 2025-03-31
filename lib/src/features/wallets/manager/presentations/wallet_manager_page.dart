/*
 Created by Thanh Son on 20/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owlet_flutter/owlets.dart';
import 'package:owlet_router/router.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../application/owlet_app_global_provider.dart';
import '../../../../../base/shared.dart';
import '../../shared.dart';
import 'bloc/wallet_manager_bloc.dart';
import 'widgets/table_cell.dart';
import 'widgets/wallet_data_grid_source.dart';

class WalletManagerPage extends StatefulWidget {
  const WalletManagerPage({required this.managerBloc, super.key});

  final WalletManagerBloc managerBloc;

  @override
  State<WalletManagerPage> createState() => _WalletManagerPageState();
}

enum ViewLayout {
  list,
  table;

  bool get isList => this == ViewLayout.list;

  bool get isTable => this == ViewLayout.table;
}

class _WalletManagerPageState extends State<WalletManagerPage> {
  final SelectedController<ViewLayout> viewLayout = SelectedController(ViewLayout.list);

  void toggleLayout() {
    switch (viewLayout.value) {
      case ViewLayout.list:
        viewLayout.value = ViewLayout.table;
      case ViewLayout.table:
        viewLayout.value = ViewLayout.list;
    }
  }

  @override
  void initState() {
    super.initState();
    widget.managerBloc.add(GetWalletListEvent());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const BaseTitleAppBar(title: 'Wallet Manager'),
        floatingActionButton: CustomPrimaryButton(
          height: 64,
          width: 64,
          onTab: () async {
            await OwletAppGlobal.routesInst.wallet.create.pushNamed();
            widget.managerBloc.add(GetWalletListEvent());
          },
          child: const AddFloatingBarIcon(),
        ),
        body: BlocListener<WalletManagerBloc, WalletManagerState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is WalletErrorState) {
              AppToast.showError(state.exception);
            }
            if (state is WalletLoadingState) {
              AppToast.showLoader(timeout: const Duration(seconds: 10));
            }
            AppToast.hideLoader();
          },
          child: BlocBuilder<WalletManagerBloc, WalletManagerState>(
            buildWhen: (previous, current) => current is WalletLoadSuccessState,
            builder: (context, state) {
              if (state is WalletLoadSuccessState) {
                final source = WalletDataGridSource(items: state.wallets);
                return AppRefresh(
                    onRefresh: () async {
                      widget.managerBloc.add(GetWalletListEvent());
                    },
                    child: Column(children: [
                      ValueListenableBuilder<ViewLayout>(
                        valueListenable: viewLayout,
                        builder: (context, value, child) => IntrinsicHeight(
                            child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Spacer(),
                            AppToggleIcon(
                              isSelected: value.isList,
                              icon: const Icon(CupertinoIcons.rectangle_grid_1x2_fill),
                              unselectedIcon: const Icon(CupertinoIcons.rectangle_grid_1x2),
                              onTab: (_) {
                                if (!value.isList) {
                                  toggleLayout();
                                }
                              },
                            ),
                            const VerticalDivider(
                              thickness: 2,
                              width: 20,
                              color: Colors.black,
                            ),
                            AppToggleIcon(
                              isSelected: value.isTable,
                              icon: const Icon(CupertinoIcons.rectangle_grid_2x2_fill),
                              unselectedIcon: const Icon(CupertinoIcons.rectangle_grid_2x2),
                              onTab: (_) {
                                if (!value.isTable) {
                                  toggleLayout();
                                }
                              },
                            ),
                            16.horizontalSpacing,
                          ],
                        )),
                      ),
                      Expanded(
                          child: SfDataGridTheme(
                        data: SfDataGridThemeData(
                          gridLineColor: context.scheme.onInverseSurface,
                          frozenPaneLineColor: context.scheme.onInverseSurface,
                        ),
                        child: SfDataGrid(
                          frozenColumnsCount: 1,
                          footerFrozenRowsCount: 1,
                          shrinkWrapRows: true,
                          onQueryRowHeight: (details) => _calRowHeight(details, state.wallets),
                          source: source,
                          columns: [
                            GridColumn(
                                columnName: 'name',
                                label: const AppTableTitleCell('Name'),
                                columnWidthMode: ColumnWidthMode.fitByColumnName),
                            GridColumn(
                                columnName: 'desc',
                                label: const AppTableTitleCell('Description'),
                                columnWidthMode: ColumnWidthMode.fitByCellValue,
                                maximumWidth: 300,
                                minimumWidth: 100),
                            GridColumn(
                                columnName: 'labels',
                                width: 120,
                                label: const AppTableTitleCell('Labels'),
                                columnWidthMode: ColumnWidthMode.auto,
                                maximumWidth: 500,
                                minimumWidth: 500),
                            GridColumn(
                              columnName: 'categories',
                              label: const AppTableTitleCell('Categories'),
                              columnWidthMode: ColumnWidthMode.fitByCellValue,
                            ),
                            GridColumn(
                              columnName: 'index.income',
                              label: const AppTableTitleCell('Income'),
                              columnWidthMode: ColumnWidthMode.fitByColumnName,
                            ),
                            GridColumn(
                              columnName: 'index.expense',
                              label: const AppTableTitleCell('Expense'),
                              columnWidthMode: ColumnWidthMode.fitByColumnName,
                            ),
                          ],
                        ),
                      ))
                    ]));
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      );

  double _calRowHeight(RowHeightDetails details, List<TransactionWalletInterface> wallets) {
    if (details.rowIndex > 0) {
      final a = wallets[details.rowIndex - 1];
      if (a.label.isNotEmpty) {
        return details.getIntrinsicRowHeight(details.rowIndex);
      }
    }
    return details.rowHeight;
  }
}
