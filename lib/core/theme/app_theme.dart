import 'package:chinese_font_library/chinese_font_library.dart';
import 'package:flutter/material.dart';

ThemeData buildLightTheme() {
  // Define a custom color scheme with a "Deep Ocean Blue" primary
  // and a soft, airy feel.
  const primaryColor = Color(0xFF2563EB); // Deep Ocean Blue
  const secondaryColor = Color(0xFF0EA5E9); // Sky Blue
  const tertiaryColor = Color(0xFFF97316); // Orange for accents
  const surfaceColor = Color(0xFFFFFFFF);
  const scaffoldBackgroundColor = Color(0xFFF8FAFC); // Slate 50
  const errorColor = Color(0xFFEF4444);

  final colorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    primary: primaryColor,
    secondary: secondaryColor,
    tertiary: tertiaryColor,
    surface: surfaceColor,
    error: errorColor,
    brightness: Brightness.light,
  );

  final base = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );

  return base
      .copyWith(
        appBarTheme: base.appBarTheme.copyWith(
          backgroundColor: surfaceColor, // Solid background to avoid overlap
          foregroundColor: base.colorScheme.onSurface,
          centerTitle: false,
          elevation: 0,
          scrolledUnderElevation: 0, // Keep it flat even when scrolled
          shape: Border(
            bottom: BorderSide(
              color: base.colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          iconTheme: IconThemeData(color: base.colorScheme.onSurface),
          titleTextStyle: TextStyle(
            color: base.colorScheme.onSurface,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        cardTheme: CardThemeData(
          color: surfaceColor,
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: base.colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
        ),
        inputDecorationTheme: base.inputDecorationTheme.copyWith(
          filled: true,
          fillColor: base.colorScheme.surfaceContainerHighest.withValues(
            alpha: 0.3,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: base.colorScheme.error.withValues(alpha: 0.5),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          labelStyle: TextStyle(color: base.colorScheme.onSurfaceVariant),
          hintStyle: TextStyle(
            color: base.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            side: BorderSide(color: base.colorScheme.outline),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: base.colorScheme.outlineVariant.withValues(alpha: 0.5),
          thickness: 1,
        ),
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
        ),
      )
      .useSystemChineseFont(Brightness.light);
}
