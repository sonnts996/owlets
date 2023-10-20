/*
 Created by Thanh Son on 06/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../../../base/shared.dart';
import '../../../../../gen/assets.gen.dart';

class FloatingBar extends StatefulWidget {
  const FloatingBar({
    super.key,
    required this.mainScrollController,
    this.initialWidth = double.infinity,
    required this.onTab,
  });

  final ScrollController mainScrollController;
  final double initialWidth;
  final VoidCallback? onTab;

  @override
  State<FloatingBar> createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar> {
  late double width;
  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    width = widget.initialWidth;
    widget.mainScrollController.addListener(updateUi);
  }

  @override
  void dispose() {
    widget.mainScrollController.removeListener(updateUi);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FloatingBar oldWidget) {
    oldWidget.mainScrollController.removeListener(updateUi);
    super.didUpdateWidget(oldWidget);
    widget.mainScrollController.addListener(updateUi);
  }

  void updateUi() {
    if (widget.mainScrollController.offset > 10) {
      setState(() {
        width = 64;
        isExpanded = false;
      });
    } else {
      setState(() {
        width = MediaQuery.of(context).size.width - 2 * 32;
        isExpanded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomRight,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 350),
          height: 64,
          margin: 32.allInsets,
          width: width,
          child: CustomPrimaryButton(
              semanticLabel: 'add-new',
              onTab: widget.onTab,
              child: isExpanded
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        28.horizontalSpacing,
                        Assets.image.logoOwlet.svg(height: 56, width: 56),
                        20.horizontalSpacing,
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTitle(
                                'How are you today?',
                                textColor: context.scheme.onPrimary,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppLabel(
                                "Let's update your wallet now",
                                textColor: context.scheme.onPrimary,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        16.horizontalSpacing,
                      ],
                    )
                  : AddFloatingBarIcon()),
        ),
      );
}

