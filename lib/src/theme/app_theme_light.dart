/*
 Created by Thanh Son on 15/01/2024.
 Copyright (c) 2024 . All rights reserved.
*/
part of 'app_theme.dart';

@immutable
class AppThemeLight extends AppThemeBuilder {
  AppThemeLight({required super.appSchemes, required super.textTheme});

  late final ThemeData _theme = ThemeData.light(useMaterial3: true).copyWith(
    primaryColor: scheme.primary,
    brightness: scheme.brightness,
    canvasColor: scheme.background,
    cardColor: scheme.background,
    colorScheme: scheme,
    shadowColor: scheme.shadow,
    textTheme: textTheme.apply(
      bodyColor: appSchemes.bodyColor,
      displayColor: appSchemes.displayColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.onInverseSurface,
      surfaceTintColor: scheme.background,
      iconTheme: IconThemeData(size: 28, color: appSchemes.displayColor),
      actionsIconTheme: IconThemeData(size: 28, color: appSchemes.displayColor),
      titleTextStyle: textTheme.titleLarge,
      centerTitle: false,
      titleSpacing: NavigationToolbar.kMiddleSpacing,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    cardTheme: CardTheme(
      color: scheme.background,
      elevation: 10,
      surfaceTintColor: scheme.background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: scheme.shadow,
      margin: const EdgeInsets.fromLTRB(4, 4, 4, 16),
    ),
    scaffoldBackgroundColor: scheme.onInverseSurface,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      sizeConstraints: const BoxConstraints.expand(width: 64, height: 64),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      elevation: 2,
      backgroundColor: scheme.inverseSurface,
      iconSize: 32,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: scheme.background,
      elevation: 0,
      shape: const CircularNotchedRectangle(),
      shadowColor: Colors.blue,
      surfaceTintColor: scheme.background,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: scheme.background,
      elevation: 5,
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
      selectedLabelStyle: textTheme.labelSmall,
      unselectedLabelStyle: textTheme.labelSmall,
      selectedItemColor: scheme.primary,
      unselectedItemColor: appSchemes.bodyColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: scheme.background,
      filled: true,
      isDense: true,
      border: inputBorder(),
      focusedBorder: inputBorder(borderColor: scheme.inverseSurface),
      focusColor: scheme.inverseSurface,
      focusedErrorBorder: inputBorder(borderColor: scheme.inverseSurface),
      enabledBorder: inputBorder(),
      errorBorder: inputBorder(borderColor: scheme.error),
      disabledBorder: inputBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.inverseSurface,
        foregroundColor: scheme.onInverseSurface,
        textStyle: textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: scheme.onPrimary,
        ),
        fixedSize: const Size.fromHeight(50),
        minimumSize: const Size.fromHeight(50),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: scheme.inverseSurface,
        textStyle: textTheme.bodyLarge,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        minimumSize: const Size(50, 24),
      ),
    ),
    extensions: [
      MoneyTheme(
        addColor: const Color(0xFF1DAB8F),
        removeColor: const Color(0xFFDE4444),
        negativeColor: const Color(0xFFFFA800),
        positiveColor: const Color(0xFF408CFF),
        otherColor: const Color(0xFF7583FF),
        largeStyle: GoogleFonts.ibmPlexMono(fontSize: 20, fontWeight: FontWeight.w600),
        mediumStyle: GoogleFonts.ibmPlexMono(fontSize: 14, fontWeight: FontWeight.w600),
        smallStyle: GoogleFonts.ibmPlexMono(fontSize: 12, fontWeight: FontWeight.w600),
        largeIconSize: 20,
        mediumIconSize: 14,
        smallIconSize: 12,
      ),
      CustomDecoration(
        boxShadow: [
          BoxShadow(
            color: appSchemes.darkShadow,
            blurRadius: 3,
            spreadRadius: 5,
          ),
        ],
        lightBoxShadow: [
          BoxShadow(
            color: appSchemes.scheme.shadow.brightness(0.8),
            blurRadius: 3,
            spreadRadius: 5,
          ),
        ],
      ),
    ],
  );

  InputBorder inputBorder({Color? borderColor}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        gapPadding: 2,
        borderSide: borderColor.letOrNull(
          (it) => BorderSide(color: it),
          onNull: () => BorderSide.none,
        ),
      );

  @override
  ThemeData get theme => _theme;
}
