/*
 Created by Thanh Son on 22/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:owlet_flutter/owlets.dart';

import '../../../components/ext/contextx.dart';
import '../../../components/money_text.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    required this.walletName,
    required this.amount,
    required this.walletColor,
    required this.indexIcon,
    required this.currency,
    required this.obscuredNotifier,
    required this.onTab,
    super.key,
  });

  final String walletName;
  final double amount;
  final Color walletColor;
  final Widget indexIcon;
  final String currency;
  final MoneyObscured obscuredNotifier;

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) => Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: GestureDetector(
          onTap: onTab,
          child: CustomPaint(
            painter: WalletPainter(
              gradient: context.decoration.colorGradient(walletColor),
              clipWidth: 0,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    walletName,
                    style: context.textTheme.titleLarge?.apply(fontWeightDelta: 2),
                  ),
                  Text(
                    loremIpsum(words: 120),
                    style: context.textTheme.bodyMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.verticalSpacing,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MoneyText(
                      amount,
                      currency: currency,
                      textStyle: MoneyTextStyle.large,
                      type: MoneyType.amount,
                      obscuredNotifier: obscuredNotifier,
                      canToggleObscurity: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class WalletPainter extends CustomPainter {
  WalletPainter({
    required this.gradient,
    this.clipWidth = 16,
  });

  final double clipWidth;

  final Gradient gradient;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(clipWidth, size.height / 2 - 30);
    path.quadraticBezierTo(
      clipWidth + 16,
      size.height / 2,
      clipWidth,
      size.height / 2 + 30,
    );
    path.lineTo(clipWidth, size.height);
    path.lineTo(0, size.height / 2 - 30);

    final paint = Paint()..shader = gradient.createShader(Rect.fromLTWH(0, 0, 100, size.height));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
