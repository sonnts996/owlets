// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'app_components.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$AppComponentsTailorMixin on ThemeExtension<AppComponents> {
  AppAnimations get animations;
  AppDecoration get decoration;

  @override
  AppComponents copyWith({
    AppAnimations? animations,
    AppDecoration? decoration,
  }) {
    return AppComponents(
      animations: animations ?? this.animations,
      decoration: decoration ?? this.decoration,
    );
  }

  @override
  AppComponents lerp(covariant ThemeExtension<AppComponents>? other, double t) {
    if (other is! AppComponents) return this as AppComponents;
    return AppComponents(
      animations: t < 0.5 ? animations : other.animations,
      decoration: t < 0.5 ? decoration : other.decoration,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppComponents &&
            const DeepCollectionEquality()
                .equals(animations, other.animations) &&
            const DeepCollectionEquality()
                .equals(decoration, other.decoration));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(animations),
      const DeepCollectionEquality().hash(decoration),
    );
  }
}
