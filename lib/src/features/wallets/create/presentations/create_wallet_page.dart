/*
 Created by Thanh Son on 19/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'dart:math';

import 'package:detectable_text_field/detectable_text_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:objectx/objectx.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../components/app_back_leading.dart';
import '../../../../components/app_color_picker.dart';
import '../../../../components/ext/contextx.dart';
import '../../../../components/images/keyboard_image.dart';
import '../../../../components/overlay_options.dart';
import '../../../../components/textfield_custom_components.dart';
import '../../widgets/hash_tag_widget.dart';
import '../../widgets/wallet_categories_selector.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({super.key});

  @override
  State<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  final _categoriesKey = GlobalKey<OverlayOptionsState>(debugLabel: '_hashTagAutoCompleteKey');

  final _walletNameController = TextEditingController();
  final _descriptionController = DetectableTextEditingController(
    regExp: detectionRegExp(
      hashtag: true,
      atSign: false,
      url: false,
    ),
  );

  final colorController = ValueNotifier<Color>(const Color(0xFFeb5555));

  final nameFocusNode = FocusNode();

  final categoriesFocusNode = FocusNode();

  final descriptionFocusNode = FocusNode();

  final random = Random();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      nameFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    const sessionPadding = EdgeInsets.fromLTRB(24, 12, 0, 8);
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        if (didPop) return;
        FocusScope.of(context).unfocus(disposition: UnfocusDisposition.previouslyFocusedChild);
      },
      child: Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              collapsedHeight: kToolbarHeight,
              backgroundColor: context.theme.scaffoldBackgroundColor,
              leading: const AppBackLeading(),
              systemOverlayStyle: context.theme.appBarTheme.systemOverlayStyle,
              actions: [
                SizedBox(
                  width: 120,
                  height: 40,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(FeatherIcons.plus),
                    label: const Text('Thêm'),
                  ),
                ),
                16.horizontalSpacing,
              ],
            ),
            SliverToBoxAdapter(
              child: ColoredBox(
                color: context.theme.scaffoldBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextFormField(
                      controller: _walletNameController,
                      style: context.textTheme.titleLarge,
                      maxLength: 50,
                      maxLines: 2,
                      minLines: 1,
                      textAlignVertical: TextAlignVertical.bottom,
                      buildCounter: defaultCounterBuilder,
                      focusNode: nameFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\n')),
                      ],
                      onEditingComplete: () {
                        _categoriesKey.currentState?.show();
                      },
                      decoration: InputDecoration(
                        hintText: 'Tên ví...',
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: context.theme.inputDecorationTheme.focusedBorder!.borderSide.color,
                          ),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                        filled: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: FormLabel('Loại:', padding: sessionPadding)),
            SliverToBoxAdapter(
              child: WalletCategoriesSelector(
                autoCompleteKey: _categoriesKey,
                focusNode: categoriesFocusNode,
                onSummit: descriptionFocusNode.requestFocus,
              ),
            ),
            const SliverToBoxAdapter(child: FormLabel('Mô tả:', padding: sessionPadding)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: HashTagWidget(
                  focusNode: descriptionFocusNode,
                  controller: _descriptionController,
                  suggestionHashTagsGetter: (text) async {
                    final a = random.nextInt(10).clamp(1, 10)..print();
                    return List.generate(
                      a,
                      (index) => index == 0 ? text : '$text$index',
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: FormLabel('Màu sắc:', padding: sessionPadding)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppColorPicker(controller: colorController),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      if (!(descriptionFocusNode.hasFocus && nameFocusNode.hasFocus)) {
                        nameFocusNode.requestFocus();
                      }
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [KeyboardImage(), Text('Keyboard Area')],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
