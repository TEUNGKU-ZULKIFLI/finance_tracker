import 'package:flutter/material.dart';

/// Kumpulan tema, palet warna, dan helper untuk seluruh aplikasi.
/// Gunakan AppTheme.lightScheme / AppTheme.darkScheme untuk akses ColorScheme.
/// Gunakan AppTheme.neonWrap untuk efek glow universal.
/// Semua widget sebaiknya ambil warna dari Theme.of(context).colorScheme.

class AppTheme {
  /// Helper warna background NavigationBar
  /// Helper warna background NavigationBar
  static Color navBarBg(ColorScheme scheme) => scheme.surfaceContainerHighest;

  /// Helper warna icon NavigationBar
  /// Helper warna icon NavigationBar
  static Color navBarIcon(ColorScheme scheme, {bool selected = false}) =>
      selected ? scheme.primary : scheme.onSurfaceVariant.withOpacity(0.7);

  /// Helper warna text NavigationBar
  /// Helper warna text NavigationBar
  static Color navBarText(ColorScheme scheme, {bool selected = false}) =>
      selected ? scheme.primary : scheme.onSurfaceVariant.withOpacity(0.8);

  /// Getter ColorScheme untuk akses langsung
  static ColorScheme get lightScheme => lightTheme.colorScheme;
  static ColorScheme get darkScheme => darkTheme.colorScheme;
  // 🎨 PALETTE MATERIAL 3 — Light & Dark Mapping
  // Semua warna di bawah ini punya padanan di dua mode agar konsisten

  // PRIMARY
  static const Color primary = Color(0xFF8E24AA); // Light & Dark
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFFE1BEE7); // Light
  static const Color onPrimaryContainer = Color(0xFF4A148C); // Light
  static const Color primaryContainerDark = Color(0xFF4A148C); // Dark
  static const Color onPrimaryContainerDark = Colors.white; // Dark

  // SECONDARY
  static const Color secondary = Color(0xFF0288D1);
  static const Color onSecondary = Colors.white;
  static const Color secondaryContainer = Color(0xFFB3E5FC); // Light
  static const Color onSecondaryContainer = Color(0xFF01579B); // Light
  static const Color secondaryContainerDark = Color(0xFF01579B); // Dark
  static const Color onSecondaryContainerDark = Colors.white; // Dark

  // TERTIARY
  static const Color tertiary = Color(0xFFFF00FF);
  static const Color onTertiary = Colors.white;
  static const Color tertiaryContainer = Color(0xFFFFB3FF); // Light
  static const Color onTertiaryContainer = Color(0xFF660066); // Light
  static const Color tertiaryContainerDark = Color(0xFF3A003A); // Dark
  static const Color onTertiaryContainerDark = Colors.white; // Dark

  // ERROR
  static const Color error = Color(0xFFCF6679);
  static const Color onError = Colors.white;
  static const Color errorContainer = Color(0xFFB00020); // Light
  static const Color onErrorContainer = Colors.white; // Light
  static const Color errorContainerDark = Color(0xFF8C1D1D); // Dark
  static const Color onErrorContainerDark = Colors.white; // Dark

  // SURFACE & BACKGROUND
  static const Color surface = Color(0xFFFFFFFF); // Light
  static const Color onSurface = Color(0xFF1A1A1A); // Light
  static const Color surfaceContainerHighest = Color(0xFFF5F5F5); // Light
  static const Color onSurfaceVariant = Color(0xFF5C5C5C); // Light
  static const Color surfaceDark = Color(0xFF121212); // Dark
  static const Color onSurfaceDark = Color(0xFFFFFFFF); // Dark
  static const Color surfaceContainerHighestDark = Color(0xFF232323); // Dark
  static const Color onSurfaceVariantDark = Color(0xFFB0BEC5); // Dark

  // INVERSE
  static const Color inverseSurface = Color(0xFF303030);
  static const Color inverseOnSurface = Colors.white;
  static const Color inversePrimary = Color(0xFFD1C4E9);

  // OUTLINE
  static const Color outline = Color(0xFFB0BEC5);
  static const Color outlineVariant = Color(0xFF90A4AE);

  // FIXED
  static const Color primaryFixed = primary;
  static const Color secondaryFixed = secondary;
  static const Color tertiaryFixed = tertiary;
  static const Color primaryFixedDim = Color(0xFF7B1FA2);
  static const Color secondaryFixedDim = Color(0xFF0277BD);
  static const Color tertiaryFixedDim = Color(0xFFCC00CC);
  static const Color onFixed = Colors.white;
  static const Color onFixedVariant = Colors.black87;

  // SURFACE VARIANT
  static const Color surfaceDim = Color(0xFFEEEEEE);
  static const Color surfaceBright = Color(0xFFFFFFFF);

  // Helper state button
  static WidgetStateProperty<Color?> buttonBg(ColorScheme colorScheme) =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.primaryContainer;
        }
        if (states.contains(WidgetState.disabled)) {
          return colorScheme.surfaceContainerHighest;
        }
        return colorScheme.primary;
      });

  static WidgetStateProperty<Color?> buttonFg(Color color) =>
      WidgetStateProperty.all(color);

  // ---------------- THEME: LIGHT ----------------
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      surface: surface,
      onSurface: onSurface,
      surfaceContainerHighest: surfaceContainerHighest,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: Colors.black26,
      scrim: Colors.black54,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    ),

    // 🧱 Komponen
    appBarTheme: AppBarTheme(
      backgroundColor: primaryContainer,
      foregroundColor: onPrimary,
      titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: onPrimary,
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
  backgroundColor: surfaceContainerHighest,
      indicatorColor: tertiary.withAlpha((0.2 * 255).toInt()),
      labelTextStyle: WidgetStateProperty.all(
        const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // Buttons + Glow tipis via elevation + shadowColor
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: buttonBg(
          const ColorScheme.light().copyWith(primary: primary),
        ),
        foregroundColor: buttonFg(onPrimary),
        elevation: WidgetStateProperty.all(8),
        shadowColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.9 * 255).toInt()),
        ),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.15 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: buttonBg(
          const ColorScheme.light().copyWith(primary: primary),
        ),
        foregroundColor: buttonFg(onPrimary),
        elevation: WidgetStateProperty.all(6),
        shadowColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.8 * 255).toInt()),
        ),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.12 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          BorderSide(
            color: tertiary.withAlpha((0.8 * 255).toInt()),
            width: 1.6,
          ),
        ),
        foregroundColor: buttonFg(onPrimaryContainer),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.08 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: buttonFg(onPrimaryContainer),
        // ignore: deprecated_member_use
        overlayColor: WidgetStateProperty.all(tertiary.withOpacity(0.12)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: tertiary,
      foregroundColor: onTertiary,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: tertiary, width: 2),
      ),
      splashColor: tertiary.withAlpha((0.25 * 255).toInt()),
    ),
  );

  // ---------------- THEME: DARK ----------------
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryFixedDim,
      onPrimary: onPrimary,
      primaryContainer: primaryContainerDark,
      onPrimaryContainer: onPrimaryContainerDark,
      secondary: secondaryFixedDim,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainerDark,
      onSecondaryContainer: onSecondaryContainerDark,
      tertiary: tertiaryFixedDim,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainerDark,
      onTertiaryContainer: onTertiaryContainerDark,
      error: error,
      onError: onError,
      errorContainer: errorContainerDark,
      onErrorContainer: onErrorContainerDark,
      surface: surfaceDark,
      onSurface: onSurfaceDark,
      surfaceContainerHighest: surfaceContainerHighestDark,
      onSurfaceVariant: onSurfaceVariantDark,
      outline: outlineVariant,
      outlineVariant: Color(0xFF444444),
      shadow: Colors.black54,
      scrim: Colors.black87,
      inverseSurface: Colors.white,
      onInverseSurface: Colors.black,
      inversePrimary: primary,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF3A003A),
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Color(0xFF2C2C2C),
      indicatorColor: tertiaryFixedDim,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: buttonBg(
          const ColorScheme.dark().copyWith(primary: primaryFixedDim),
        ),
        foregroundColor: buttonFg(onPrimary),
        elevation: WidgetStateProperty.all(10),
        shadowColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.95 * 255).toInt()),
        ),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.18 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: buttonBg(
          const ColorScheme.dark().copyWith(primary: primaryFixedDim),
        ),
        foregroundColor: buttonFg(onPrimary),
        elevation: WidgetStateProperty.all(8),
        shadowColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.9 * 255).toInt()),
        ),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.16 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: WidgetStateProperty.all(
          const BorderSide(color: tertiaryFixedDim, width: 1.6),
        ),
        foregroundColor: buttonFg(Colors.white),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.1 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: buttonFg(Colors.white),
        overlayColor: WidgetStateProperty.all(
          tertiary.withAlpha((0.14 * 255).toInt()),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: tertiaryFixedDim,
      foregroundColor: onTertiary,
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        side: BorderSide(color: tertiary, width: 2),
      ),
      splashColor: tertiary,
    ),
  );

  // 🔮 Wrapper universal untuk glow beneran (BoxShadow)
  static Widget neonWrap({
    required Widget child,
    Color color = tertiary,
    double blur = 24,
    double spread = 1.8,
    bool circle = false,
    BorderRadius? radius,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: circle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: circle ? null : (radius ?? BorderRadius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: color.withAlpha((0.80 * 255).toInt()),
            blurRadius: blur,
            spreadRadius: spread,
          ),
        ],
      ),
      child: child,
    );
  }
}
