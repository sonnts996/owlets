// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, unnecessary_cast

part of 'money_theme.dart';

// **************************************************************************
// TailorAnnotationsGenerator
// **************************************************************************

mixin _$MoneyThemeTailorMixin on ThemeExtension<MoneyTheme> {
  Color get addColor;
  Color get removeColor;
  Color get negativeColor;
  Color get positiveColor;
  Color get otherColor;
  TextStyle get largeStyle;
  TextStyle get mediumStyle;
  TextStyle get smallStyle;
  double get largeIconSize;
  double get mediumIconSize;
  double get smallIconSize;

  @override
  MoneyTheme copyWith({
    Color? addColor,
    Color? removeColor,
    Color? negativeColor,
    Color? positiveColor,
    Color? otherColor,
    TextStyle? largeStyle,
    TextStyle? mediumStyle,
    TextStyle? smallStyle,
    double? largeIconSize,
    double? mediumIconSize,
    double? smallIconSize,
  }) {
    return MoneyTheme(
      addColor: addColor ?? this.addColor,
      removeColor: removeColor ?? this.removeColor,
      negativeColor: negativeColor ?? this.negativeColor,
      positiveColor: positiveColor ?? this.positiveColor,
      otherColor: otherColor ?? this.otherColor,
      largeStyle: largeStyle ?? this.largeStyle,
      mediumStyle: mediumStyle ?? this.mediumStyle,
      smallStyle: smallStyle ?? this.smallStyle,
      largeIconSize: largeIconSize ?? this.largeIconSize,
      mediumIconSize: mediumIconSize ?? this.mediumIconSize,
      smallIconSize: smallIconSize ?? this.smallIconSize,
    );
  }

  @override
  MoneyTheme lerp(covariant ThemeExtension<MoneyTheme>? other, double t) {
    if (other is! MoneyTheme) return this as MoneyTheme;
    return MoneyTheme(
      addColor: Color.lerp(addColor, other.addColor, t)!,
      removeColor: Color.lerp(removeColor, other.removeColor, t)!,
      negativeColor: Color.lerp(negativeColor, other.negativeColor, t)!,
      positiveColor: Color.lerp(positiveColor, other.positiveColor, t)!,
      otherColor: Color.lerp(otherColor, other.otherColor, t)!,
      largeStyle: TextStyle.lerp(largeStyle, other.largeStyle, t)!,
      mediumStyle: TextStyle.lerp(mediumStyle, other.mediumStyle, t)!,
      smallStyle: TextStyle.lerp(smallStyle, other.smallStyle, t)!,
      largeIconSize: t < 0.5 ? largeIconSize : other.largeIconSize,
      mediumIconSize: t < 0.5 ? mediumIconSize : other.mediumIconSize,
      smallIconSize: t < 0.5 ? smallIconSize : other.smallIconSize,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoneyTheme &&
            const DeepCollectionEquality().equals(addColor, other.addColor) &&
            const DeepCollectionEquality()
                .equals(removeColor, other.removeColor) &&
            const DeepCollectionEquality()
                .equals(negativeColor, other.negativeColor) &&
            const DeepCollectionEquality()
                .equals(positiveColor, other.positiveColor) &&
            const DeepCollectionEquality()
                .equals(otherColor, other.otherColor) &&
            const DeepCollectionEquality()
                .equals(largeStyle, other.largeStyle) &&
            const DeepCollectionEquality()
                .equals(mediumStyle, other.mediumStyle) &&
            const DeepCollectionEquality()
                .equals(smallStyle, other.smallStyle) &&
            const DeepCollectionEquality()
                .equals(largeIconSize, other.largeIconSize) &&
            const DeepCollectionEquality()
                .equals(mediumIconSize, other.mediumIconSize) &&
            const DeepCollectionEquality()
                .equals(smallIconSize, other.smallIconSize));
  }

  @override
  int get hashCode {
    return Object.hash(
      runtimeType.hashCode,
      const DeepCollectionEquality().hash(addColor),
      const DeepCollectionEquality().hash(removeColor),
      const DeepCollectionEquality().hash(negativeColor),
      const DeepCollectionEquality().hash(positiveColor),
      const DeepCollectionEquality().hash(otherColor),
      const DeepCollectionEquality().hash(largeStyle),
      const DeepCollectionEquality().hash(mediumStyle),
      const DeepCollectionEquality().hash(smallStyle),
      const DeepCollectionEquality().hash(largeIconSize),
      const DeepCollectionEquality().hash(mediumIconSize),
      const DeepCollectionEquality().hash(smallIconSize),
    );
  }
}
