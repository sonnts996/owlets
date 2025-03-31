/*
 Created by Thanh Son on 25/10/2023.
 Copyright (c) 2023 . All rights reserved.
*/
part of 'app_toast.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key, this.from, this.timeout = const Duration(days: 1), this.onTimeout});

  final Offset? from;
  final Duration timeout;
  final void Function()? onTimeout;

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  final Tween<double> animation = Tween(begin: 1, end: 0);
  late Timer timer;

  Offset get startPosition {
    if (widget.from == null) return Offset.zero;
    return widget.from! - (Offset(.5.sw, .5.sh) - const Offset(16, 16));
  }

  @override
  void initState() {
    super.initState();
    timer = Timer(widget.timeout, () => widget.onTimeout?.call());
  }

  void resetTimeout() {
    timer.cancel();
    timer = Timer(widget.timeout, () => widget.onTimeout?.call());
  }

  @override
  void dispose() {
    timer.cancel(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        tween: animation,
        builder: (context, value, child) => Material(
            color: context.scheme.shadow.withOpacity(0.15 * (1 - value)),
            child: Center(
                child: Transform.translate(
                    offset: startPosition * value,
                    child: Container(
                        height: 72,
                        width: 72,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: OwletAppGlobal.themeInst.current.colorScheme.background.withOpacity(1 - value),
                          borderRadius: 24.circleBorderRadius,
                        ),
                        child: child)))),
        child: const LoaderIcon(size: 32),
      );
}
