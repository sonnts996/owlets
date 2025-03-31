/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
part of 'app_toast.dart';

class AnimatedToast extends StatefulWidget {
  const AnimatedToast({
    required this.message,
    required this.transitionDuration,
    super.key,
  });

  final String message;
  final Duration transitionDuration;

  @override
  State<AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<AnimatedToast> with TickerProviderStateMixin {
  bool shouldShownText = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.transitionDuration, // lottie duration
        () {
      setState(() {
        shouldShownText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: 16.horizontalInsets,
      decoration: BoxDecoration(
          color: context.scheme.surface,
          borderRadius: BorderRadius.circular(20),
          boxShadow: context.decoration.primaryShadow),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 350),
        alignment: Alignment.centerLeft,
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.image.animations.successAnimations.lottie(
                height: 32,
                width: 32,
                repeat: false,
              ),
              if (shouldShownText)
                Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: AppLabel(
                      widget.message,
                      textColor: context.scheme.onBackground,
                    )),
            ]),
      ));
}
