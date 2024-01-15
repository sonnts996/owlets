// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'custom_decoration.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$CustomDecorationTailorMixin on ThemeExtension<CustomDecoration> {
  List<BoxShadow> get boxShadow;
  List<BoxShadow> get lightBoxShadow;

  @override
  CustomDecoration copyWith({
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? lightBoxShadow,
  }) {
    return CustomDecoration(
      boxShadow: boxShadow ?? this.boxShadow,
      lightBoxShadow: lightBoxShadow ?? this.lightBoxShadow,
    );
  }

  @override
  CustomDecoration lerp(
      covariant ThemeExtension<CustomDecoration>? other, double t) {
    if (other is! CustomDecoration) return this as CustomDecoration;
    return CustomDecoration(
      boxShadow: t < 0.5 ? boxShadow : other.boxShadow,
      lightBoxShadow: t < 0.5 ? lightBoxShadow : other.lightBoxShadow,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomDecoration &&
            const DeepCollectionEquality().equals(boxShadow, other.boxShadow) &&
            const DeepCollectionEquality()
                .equals(lightBoxShadow, other.lightBoxShadow));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(boxShadow),
      const DeepCollectionEquality().hash(lightBoxShadow),
    );
  }
}
