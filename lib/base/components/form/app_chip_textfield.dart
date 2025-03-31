/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/

import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../shared.dart';
import '../buttons/app_chip.dart';

class AppChipTextField extends StatefulWidget {
  const AppChipTextField({
    super.key,
    this.hint,
    this.initialValues = const {},
    this.label,
    this.valueGetter,
  });

  final String? hint;
  final String? label;
  final Set<String> initialValues;
  final InternalValueGetter<Set<String>>? valueGetter;

  @override
  State<AppChipTextField> createState() => _AppChipTextFieldState();
}

class _AppChipTextFieldState extends State<AppChipTextField> {
  late final Set<String> values;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(debugLabel: 'AppChipTextField');

  @override
  void initState() {
    super.initState();
    values = Set.from(widget.initialValues);
    widget.valueGetter?.closure = () => values;
  }

  @override
  void dispose() {
    widget.valueGetter?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: _focusNode.requestFocus,
        child: AppDecorationForm(
          label: widget.label,
          focusNode: _focusNode,
          child: Wrap(
              runAlignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.start,
              runSpacing: 4,
              spacing: 4,
              children: [
                ...values.map((e) => DeletableChip(e, onDelete: () {
                      setState(() {
                        values.remove(e);
                      });
                    })),
                AutoSizeTextField(
                    controller: _controller,
                    fullwidth: false,
                    focusNode: _focusNode,
                    style: context.theme.textTheme.bodyMedium,
                    onChanged: (value) {
                      if (value.contains(',')) {
                        setState(() {
                          _controller.text = '';
                          final list = value.split(',');
                          setState(() {
                            values
                              ..addAll(list)
                              ..removeWhere((element) => element.isEmpty);
                          });
                        });
                      }
                    },
                    onSubmitted: (value) {
                      final list = value.split(',');
                      setState(() {
                        _controller.text = '';
                        values
                          ..addAll(list)
                          ..removeWhere((element) => element.isEmpty);
                      });
                    },
                    minWidth: 100,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.hint,
                      hintStyle: context.theme.textTheme.bodyMedium?.apply(color: context.scheme.outline),
                      filled: false,
                      isDense: true,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    )),
              ]),
        ),
      );
}
