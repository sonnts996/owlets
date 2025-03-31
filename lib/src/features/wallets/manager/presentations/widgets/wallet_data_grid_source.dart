/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:objectx/objectx.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../../../../base/components/app_text.dart';
import '../../../../../../base/components/buttons/app_chip.dart';
import '../../../shared.dart';
import 'table_cell.dart';

class WalletDataGridSource extends DataGridSource {
  WalletDataGridSource({required this.items}) {
    _rows = items
        .map((e) => DataGridRow(cells: [
              DataGridCell(columnName: 'name', value: e),
              DataGridCell(columnName: 'desc', value: e.descriptions),
              DataGridCell<List<String>>(columnName: 'labels', value: e.label),
              DataGridCell(columnName: 'categories', value: e.walletIndex.name),
              DataGridCell(columnName: 'index.income', value: e.walletIndex.inputType),
              DataGridCell(columnName: 'index.expense', value: e.walletIndex.outputType)
            ]))
        .toList();
  }

  final List<TransactionWalletInterface> items;

  late final List<DataGridRow> _rows;

  @override
  List<DataGridRow> get rows => _rows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) => DataGridRowAdapter(
          cells: row.getCells().map((e) {
        if (e.columnName == 'labels') {
          return AppTableCell(
              child: Text.rich(
            TextSpan(
                children: (e.value as Object)
                    .castTo<List<String>>(defaultValue: [])
                    .map<InlineSpan>((elem) => WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                          child: AppActionChip(text: elem, constraints: const BoxConstraints(maxWidth: 100)),
                        )))
                    .toList()),
            // maxLines: 1,
            softWrap: true,
            // overflow: TextOverflow.fade,
          ));
        } else if (e.columnName.startsWith('index.income')) {
          return AppTableCell(
              child: Checkbox(
            value: e.value == WalletIndexType.income,
            onChanged: (value) {},
          ));
        } else if (e.columnName.startsWith('index.expense')) {
          return AppTableCell(
              child: Checkbox(
            value: e.value == WalletIndexType.expense,
            onChanged: (value) {},
          ));
        } else if (e.columnName == 'name') {
          final item = (e.value as Object).castTo<TransactionWalletInterface>();

          return AppTableCell(
            sideColor: item.color,
            child: AppLabel(item.name),
          );
        }
        return AppTableCell(child: AppLabel(e.value.toString()));
      }).toList());
}
