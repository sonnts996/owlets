/*
 Created by Thanh Son on 09/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/

import 'package:detectable_text_field/detectable_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:objectx/objectx.dart';

import '../../../components/ext/contextx.dart';
import '../../../components/overlay_options.dart';
import '../../../components/textfield_custom_components.dart';

class HashTagWidget extends StatefulWidget {
  HashTagWidget({
    required this.controller,
    required this.focusNode,
    required this.suggestionHashTagsGetter,
    super.key,
    GlobalKey<OverlayOptionsState>? autoCompleteKey,
  }) : autoCompleteKey = autoCompleteKey ?? GlobalKey<OverlayOptionsState>(debugLabel: '_hashTagAutoCompleteKey');

  final FocusNode focusNode;
  final DetectableTextEditingController controller;
  final GlobalKey<OverlayOptionsState> autoCompleteKey;

  final Future<List<String>> Function(String text) suggestionHashTagsGetter;

  @override
  State<HashTagWidget> createState() => _HashTagWidgetState();
}

class _HashTagWidgetState extends State<HashTagWidget> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onTextChanged);
    super.dispose();
  }

  void onTextChanged() {
    final typing = widget.controller.typingDetection?.trim() ?? '';
    if (typing.isEmpty) {
      widget.autoCompleteKey.currentState?.close();
    } else {
      widget.autoCompleteKey.currentState?.show();
    }
  }

  Widget suggestionBuilder(BuildContext context) {
    final typing = widget.controller.typingDetection?.trim() ?? '';
    if (typing.isEmpty) return const SizedBox.shrink();
    return FutureBuilder<List<String>>(
      future: widget.suggestionHashTagsGetter(typing),
      builder: (context, snapshot) {
        if (snapshot.hasData && (snapshot.data?.isNotEmpty ?? false)) {
          return Scrollbar(
            thumbVisibility: true,
            controller: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  snapshot.data!.length,
                  (index) => InkWell(
                    onTap: () => onChoseSuggestion(typing, snapshot.data![index]),
                    child: Ink(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: index.isOdd ? context.scheme.surfaceVariant : Colors.transparent,
                      ),
                      child: Text(snapshot.data![index]),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  void onChoseSuggestion(String from, String replace) {
    final selection = widget.controller.selection;
    Match? finalMatch;
    String replacement(Match match) {
      if (match.start <= selection.start && match.end >= selection.end) {
        finalMatch = match;
        return replace;
      }
      return match.group(0)!;
    }

    final rs = widget.controller.text.replaceAllMapped(from, replacement);
    widget.controller.text = rs;
    finalMatch?.let((it) => widget.controller.selection = TextSelection.collapsed(offset: it.start + replace.length));
    widget.autoCompleteKey.currentState?.close();
  }

  @override
  Widget build(BuildContext context) => OverlayOptions(
        key: widget.autoCompleteKey,
        focusNode: widget.focusNode,
        offset: const Offset(0, -30),
        overlay: ValueListenableBuilder(
          valueListenable: widget.controller,
          builder: (context, value, child) => suggestionBuilder(context),
        ),
        child: FocusBuilder(
          focusNode: widget.focusNode,
          builder: (context, focusNode) => DetectableTextField(
            maxLength: 250,
            maxLines: null,
            minLines: 1,
            focusNode: widget.focusNode,
            controller: widget.controller,
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\n')),
            ],
            textAlignVertical: TextAlignVertical.top,
            buildCounter: defaultCounterBuilder,
            decoration: InputDecoration(
              hintText: '#tag để thêm nhãn...',
              prefixIcon: focusNode.hasFocus || widget.controller.text.isNotEmpty
                  ? null
                  : const Icon(FeatherIcons.alignLeft, size: 20),
              prefix: focusNode.hasFocus || widget.controller.text.isNotEmpty
                  ? const TextFieldPrefixIcon(icon: Icon(FeatherIcons.alignLeft, size: 20))
                  : null,
            ),
          ),
        ),
      );
}
