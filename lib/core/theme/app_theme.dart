import 'dart:ui';

import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flutter/material.dart';

class ModernUI extends ThemeExtension<ModernUI> {
  const ModernUI({
    required this.glassSurface,
    required this.elevatedSurface,
    required this.surfaceLayer,
    required this.borderSubtle,
    required this.textPrimary,
    required this.textSecondary,
    required this.shadowColor,
    required this.cardRadius,
    required this.buttonRadius,
    required this.sheetRadius,
  });

  final Color glassSurface;
  final Color elevatedSurface;
  final Color surfaceLayer;
  final Color borderSubtle;
  final Color textPrimary;
  final Color textSecondary;
  final Color shadowColor;
  final double cardRadius;
  final double buttonRadius;
  final double sheetRadius;

  @override
  ModernUI copyWith({
    Color? glassSurface,
    Color? elevatedSurface,
    Color? surfaceLayer,
    Color? borderSubtle,
    Color? textPrimary,
    Color? textSecondary,
    Color? shadowColor,
    double? cardRadius,
    double? buttonRadius,
    double? sheetRadius,
  }) {
    return ModernUI(
      glassSurface: glassSurface ?? this.glassSurface,
      elevatedSurface: elevatedSurface ?? this.elevatedSurface,
      surfaceLayer: surfaceLayer ?? this.surfaceLayer,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      shadowColor: shadowColor ?? this.shadowColor,
      cardRadius: cardRadius ?? this.cardRadius,
      buttonRadius: buttonRadius ?? this.buttonRadius,
      sheetRadius: sheetRadius ?? this.sheetRadius,
    );
  }

  @override
  ModernUI lerp(ThemeExtension<ModernUI>? other, double t) {
    if (other is! ModernUI) return this;
    return ModernUI(
      glassSurface: Color.lerp(glassSurface, other.glassSurface, t)!,
      elevatedSurface: Color.lerp(elevatedSurface, other.elevatedSurface, t)!,
      surfaceLayer: Color.lerp(surfaceLayer, other.surfaceLayer, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t)!,
      buttonRadius: lerpDouble(buttonRadius, other.buttonRadius, t)!,
      sheetRadius: lerpDouble(sheetRadius, other.sheetRadius, t)!,
    );
  }
}

ThemeData buildLightTheme() {
  const primaryColor = Color(0xFF1E88E5); // 科技蓝
  const secondaryColor = Color(0xFF20C6B7); // 清透青
  const tertiaryColor = Color(0xFF8C8CFB); // 柔和紫
  const surfaceLayer = Color(0xFFFFFFFF);
  const scaffoldBackgroundColor = Color(0xFFF2F4F8);
  const errorColor = Color(0xFFF45B69);
  const borderSubtle = Color(0x1F0F172A);

  final colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    tertiary: tertiaryColor,
    onTertiary: Colors.white,
    error: errorColor,
    onError: Colors.white,
    surface: surfaceLayer,
    onSurface: const Color(0xFF0F172A),
    outline: borderSubtle.withValues(alpha: 0.2),
    outlineVariant: borderSubtle,
  );

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );

  final modern = ModernUI(
    glassSurface: Colors.white.withValues(alpha: 0.65),
    elevatedSurface: Colors.white,
    surfaceLayer: surfaceLayer,
    borderSubtle: const Color(0x1F0F172A),
    textPrimary: const Color(0xFF0F172A),
    textSecondary: const Color(0xFF475569),
    shadowColor: const Color(0x330F172A),
    cardRadius: 18,
    buttonRadius: 14,
    sheetRadius: 24,
  );

  final textTheme = base.textTheme.copyWith(
    headlineLarge: base.textTheme.headlineLarge?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    headlineMedium: base.textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4,
    ),
    headlineSmall: base.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
    ),
    titleLarge: base.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
    ),
    titleMedium: base.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    ),
    titleSmall: base.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: base.textTheme.bodyLarge?.copyWith(height: 1.5),
    bodyMedium: base.textTheme.bodyMedium?.copyWith(height: 1.5),
    bodySmall: base.textTheme.bodySmall?.copyWith(height: 1.5),
  );

  return base.copyWith(
    extensions: [modern],
    textTheme: textTheme.useSystemChineseFont(Brightness.light),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: textTheme.titleLarge?.useSystemChineseFont(),
    ),
    cardTheme: CardThemeData(
      color: modern.elevatedSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(modern.cardRadius),
        side: BorderSide(color: modern.borderSubtle),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: modern.glassSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: modern.borderSubtle),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: modern.borderSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: primaryColor, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: textTheme.bodyMedium
          ?.copyWith(color: modern.textSecondary.withValues(alpha: 0.8))
          .useSystemChineseFont(),
      labelStyle: textTheme.bodyMedium
          ?.copyWith(color: modern.textSecondary)
          .useSystemChineseFont(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(56, 48),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(modern.buttonRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ).useSystemChineseFont(),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(56, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(modern.buttonRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ).useSystemChineseFont(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(56, 48),
        side: BorderSide(color: modern.borderSubtle.withValues(alpha: 0.8)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(modern.buttonRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ).useSystemChineseFont(),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 68,
      backgroundColor: modern.elevatedSurface,
      indicatorColor: primaryColor.withValues(alpha: 0.1),
      labelTextStyle: WidgetStateProperty.all(
        textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? primaryColor : modern.textSecondary,
          size: 22,
        );
      }),
    ),
    dividerTheme: DividerThemeData(color: modern.borderSubtle, thickness: 1),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      tileColor: Colors.transparent,
    ),
  );
}

ThemeData buildDarkTheme() {
  const primaryColor = Color(0xFF1E88E5);
  const secondaryColor = Color(0xFF20C6B7);
  const tertiaryColor = Color(0xFF8C8CFB);
  const surfaceLayer = Color(0xFF111827);
  const scaffoldBackgroundColor = Color(0xFF0B1220);
  const errorColor = Color(0xFFF45B69);
  const borderSubtle = Color(0x22E2E8F0);

  final colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: Colors.white,
    secondary: secondaryColor,
    onSecondary: Colors.white,
    tertiary: tertiaryColor,
    onTertiary: Colors.white,
    error: errorColor,
    onError: Colors.white,
    surface: surfaceLayer,
    onSurface: const Color(0xFFE2E8F0),
    outline: borderSubtle.withValues(alpha: 0.2),
    outlineVariant: borderSubtle,
  );

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );

  final modern = ModernUI(
    glassSurface: Colors.white.withValues(alpha: 0.06),
    elevatedSurface: const Color(0xFF141C2B),
    surfaceLayer: surfaceLayer,
    borderSubtle: const Color(0x22E2E8F0),
    textPrimary: const Color(0xFFE7EDF7),
    textSecondary: const Color(0xFFA3B1C6),
    shadowColor: const Color(0x66000000),
    cardRadius: 18,
    buttonRadius: 14,
    sheetRadius: 24,
  );

  final textTheme = base.textTheme.copyWith(
    headlineLarge: base.textTheme.headlineLarge?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
      color: modern.textPrimary,
    ),
    headlineMedium: base.textTheme.headlineMedium?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.4,
      color: modern.textPrimary,
    ),
    headlineSmall: base.textTheme.headlineSmall?.copyWith(
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
      color: modern.textPrimary,
    ),
    titleLarge: base.textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w700,
      color: modern.textPrimary,
    ),
    titleMedium: base.textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: modern.textPrimary,
    ),
    titleSmall: base.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: modern.textPrimary,
    ),
    bodyLarge: base.textTheme.bodyLarge?.copyWith(
      height: 1.5,
      color: modern.textSecondary,
    ),
    bodyMedium: base.textTheme.bodyMedium?.copyWith(
      height: 1.5,
      color: modern.textSecondary,
    ),
    bodySmall: base.textTheme.bodySmall?.copyWith(
      height: 1.5,
      color: modern.textSecondary,
    ),
  );

  return base.copyWith(
    extensions: [modern],
    textTheme: textTheme.useSystemChineseFont(Brightness.dark),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: modern.textPrimary,
      titleTextStyle: textTheme.titleLarge?.useSystemChineseFont(),
    ),
    cardTheme: CardThemeData(
      color: modern.elevatedSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(modern.cardRadius),
        side: BorderSide(color: modern.borderSubtle),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: modern.glassSurface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: modern.borderSubtle),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: modern.borderSubtle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: primaryColor, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: textTheme.bodyMedium
          ?.copyWith(color: modern.textSecondary.withValues(alpha: 0.8))
          .useSystemChineseFont(),
      labelStyle: textTheme.bodyMedium
          ?.copyWith(color: modern.textSecondary)
          .useSystemChineseFont(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(56, 48),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(modern.buttonRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ).useSystemChineseFont(),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(56, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(modern.buttonRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ).useSystemChineseFont(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(56, 48),
        side: BorderSide(color: modern.borderSubtle.withValues(alpha: 0.8)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(modern.buttonRadius),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ).useSystemChineseFont(),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 68,
      backgroundColor: modern.elevatedSurface,
      indicatorColor: primaryColor.withValues(alpha: 0.15),
      labelTextStyle: WidgetStateProperty.all(
        textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(
          color: selected ? primaryColor : modern.textSecondary,
          size: 22,
        );
      }),
    ),
    dividerTheme: DividerThemeData(color: modern.borderSubtle, thickness: 1),
    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      tileColor: Colors.transparent,
      iconColor: modern.textSecondary,
      textColor: modern.textPrimary,
    ),
  );
}
