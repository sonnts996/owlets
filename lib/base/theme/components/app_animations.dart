/*
 Created by Thanh Son on 19/09/2023.
 Copyright (c) 2023 . All rights reserved.
*/
class AppAnimations {
  const AppAnimations({
    this.normalDuration = const Duration(milliseconds: 350),
    this.longDuration = const Duration(seconds: 1),
  });

  final Duration normalDuration;

  final Duration longDuration;
}
