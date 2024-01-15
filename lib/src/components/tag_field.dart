/*
 Created by Thanh Son on 08/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ext/contextx.dart';

@deprecated
class TagField extends StatefulWidget {
  const TagField({super.key});

  @override
  State<TagField> createState() => _TagFieldState();
}

class _TagFieldState extends State<TagField> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  bool isFocused = false;
  final List<String> values = [];

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocused);
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocused);
    super.dispose();
  }

  void onFocused() {
    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(values.isNotEmpty ? 8 : 0, 3, 8, 3),
        decoration: BoxDecoration(
          color: context.theme.inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(16),
          border: isFocused ? Border.all(color: context.scheme.primary) : null,
        ),
        child: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 4,
          children: [
            ...values.map(
              (e) => SizedBox(
                height: 40,
                child: Chip(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  deleteIconColor: context.scheme.tertiary,
                  deleteIcon: const Icon(FeatherIcons.delete, size: 20),
                  onDeleted: () {
                    setState(() {
                      values.remove(e);
                    });
                  },
                  label: Text(e),
                ),
              ),
            ),
            RawKeyboardListener(
              focusNode: focusNode,
              onKey: onBackspacePressed,
              child: AutoSizeTextField(
                controller: _controller,
                fullwidth: false,
                minWidth: 100,
                maxLines: 1,
                style: context.textTheme.bodyLarge,
                onChanged: onTextFormChanged,
                onSubmitted: onTextFormSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Nhãn..',
                  filled: false,
                  isDense: false,
                  prefixIcon: Icon(FeatherIcons.tag, size: 20),
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );

  void onTextFormSubmitted(String value) {
    final list = value.split(',');
    setState(() {
      _controller.text = '';
      values
        ..addAll(list)
        ..removeWhere((element) => element.isEmpty);
    });
  }

  void onTextFormChanged(String value) {
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
  }

  void onBackspacePressed(RawKeyEvent value) {
    if (value.isKeyPressed(LogicalKeyboardKey.backspace)) {
      if (_controller.text.isEmpty) {
        if (values.isNotEmpty) {
          setState(() {
            _controller.text = values.removeAt(values.length - 1);
          });
        }
      }
    }
  }
}
