import "package:flutter/material.dart";

// Custom color extension for expense and income
extension CustomColors on ColorScheme {
  Color get expense => const Color(0xfff36b7f); // Soft red
  Color get income => const Color(0xff4caf50); // Soft green
  Color get primer => const Color(0xff1E3A8A); // warna primer
  Color get sekunder => const Color(0xffF97316); // warna sekunder
  Color get tersier => const Color(0xff84CC16); // warna tersier
}

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4c4490),
      surfaceTint: Color(0xff5c54a2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff645caa),
      onPrimaryContainer: Color(0xffe7e1ff),
      secondary: Color(0xff6c5293),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa084ca),
      onSecondaryContainer: Color(0xff351b5b),
      tertiary: Color(0xff665685),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbface0),
      onTertiaryContainer: Color(0xff4e3e6b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1c1b20),
      onSurfaceVariant: Color(0xff474551),
      outline: Color(0xff787582),
      outlineVariant: Color(0xffc9c4d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313035),
      inversePrimary: Color(0xffc6bfff),
      primaryFixed: Color(0xffe4dfff),
      onPrimaryFixed: Color(0xff18085b),
      primaryFixedDim: Color(0xffc6bfff),
      onPrimaryFixedVariant: Color(0xff443c88),
      secondaryFixed: Color(0xffecdcff),
      onSecondaryFixed: Color(0xff26094c),
      secondaryFixedDim: Color(0xffd6baff),
      onSecondaryFixedVariant: Color(0xff533a7a),
      tertiaryFixed: Color(0xffebdcff),
      onTertiaryFixed: Color(0xff22133d),
      tertiaryFixedDim: Color(0xffd1bef3),
      onTertiaryFixedVariant: Color(0xff4e3f6b),
      surfaceDim: Color(0xffddd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f9),
      surfaceContainer: Color(0xfff1ecf4),
      surfaceContainerHigh: Color(0xffebe7ee),
      surfaceContainerHighest: Color(0xffe5e1e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff332a76),
      surfaceTint: Color(0xff5c54a2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff645caa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff422868),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7b60a3),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3d2e5a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff766594),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff111116),
      onSurfaceVariant: Color(0xff373540),
      outline: Color(0xff53515c),
      outlineVariant: Color(0xff6e6b78),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313035),
      inversePrimary: Color(0xffc6bfff),
      primaryFixed: Color(0xff6b63b2),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff524a97),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7b60a3),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff624889),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff766594),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5d4d7a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c5cc),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2f9),
      surfaceContainer: Color(0xffebe7ee),
      surfaceContainerHigh: Color(0xffdfdbe3),
      surfaceContainerHighest: Color(0xffd4d0d7),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff291f6c),
      surfaceTint: Color(0xff5c54a2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff473e8b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff371e5d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff563c7c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff33244f),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff51416e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2c2b35),
      outlineVariant: Color(0xff4a4853),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313035),
      inversePrimary: Color(0xffc6bfff),
      primaryFixed: Color(0xff473e8b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff302672),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff563c7c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3e2564),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff51416e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3a2b56),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb7be),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4eff7),
      surfaceContainer: Color(0xffe5e1e8),
      surfaceContainerHigh: Color(0xffd7d3da),
      surfaceContainerHighest: Color(0xffc9c5cc),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc6bfff),
      surfaceTint: Color(0xffc6bfff),
      onPrimary: Color(0xff2d2470),
      primaryContainer: Color(0xff645caa),
      onPrimaryContainer: Color(0xffe7e1ff),
      secondary: Color(0xffd6baff),
      onSecondary: Color(0xff3c2262),
      secondaryContainer: Color(0xffa084ca),
      onSecondaryContainer: Color(0xff351b5b),
      tertiary: Color(0xffdbc7fd),
      onTertiary: Color(0xff372853),
      tertiaryContainer: Color(0xffbface0),
      onTertiaryContainer: Color(0xff4e3e6b),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141318),
      onSurface: Color(0xffe5e1e8),
      onSurfaceVariant: Color(0xffc9c4d2),
      outline: Color(0xff928f9c),
      outlineVariant: Color(0xff474551),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e8),
      inversePrimary: Color(0xff5c54a2),
      primaryFixed: Color(0xffe4dfff),
      onPrimaryFixed: Color(0xff18085b),
      primaryFixedDim: Color(0xffc6bfff),
      onPrimaryFixedVariant: Color(0xff443c88),
      secondaryFixed: Color(0xffecdcff),
      onSecondaryFixed: Color(0xff26094c),
      secondaryFixedDim: Color(0xffd6baff),
      onSecondaryFixedVariant: Color(0xff533a7a),
      tertiaryFixed: Color(0xffebdcff),
      onTertiaryFixed: Color(0xff22133d),
      tertiaryFixedDim: Color(0xffd1bef3),
      onTertiaryFixedVariant: Color(0xff4e3f6b),
      surfaceDim: Color(0xff141318),
      surfaceBright: Color(0xff3a383e),
      surfaceContainerLowest: Color(0xff0e0e12),
      surfaceContainerLow: Color(0xff1c1b20),
      surfaceContainer: Color(0xff201f24),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffded8ff),
      surfaceTint: Color(0xffc6bfff),
      onPrimary: Color(0xff221765),
      primaryContainer: Color(0xff8f87d8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe8d5ff),
      onSecondary: Color(0xff311656),
      secondaryContainer: Color(0xffa084ca),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffe6d5ff),
      onTertiary: Color(0xff2c1d48),
      tertiaryContainer: Color(0xffbface0),
      onTertiaryContainer: Color(0xff2f214b),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdfdae8),
      outline: Color(0xffb4b0bd),
      outlineVariant: Color(0xff928e9b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e8),
      inversePrimary: Color(0xff453d89),
      primaryFixed: Color(0xffe4dfff),
      onPrimaryFixed: Color(0xff0d0048),
      primaryFixedDim: Color(0xffc6bfff),
      onPrimaryFixedVariant: Color(0xff332a76),
      secondaryFixed: Color(0xffecdcff),
      onSecondaryFixed: Color(0xff1a003d),
      secondaryFixedDim: Color(0xffd6baff),
      onSecondaryFixedVariant: Color(0xff422868),
      tertiaryFixed: Color(0xffebdcff),
      onTertiaryFixed: Color(0xff170732),
      tertiaryFixedDim: Color(0xffd1bef3),
      onTertiaryFixedVariant: Color(0xff3d2e5a),
      surfaceDim: Color(0xff141318),
      surfaceBright: Color(0xff454449),
      surfaceContainerLowest: Color(0xff07070b),
      surfaceContainerLow: Color(0xff1e1d22),
      surfaceContainer: Color(0xff28272d),
      surfaceContainerHigh: Color(0xff333237),
      surfaceContainerHighest: Color(0xff3e3d43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff2edff),
      surfaceTint: Color(0xffc6bfff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc2bbff),
      onPrimaryContainer: Color(0xff080038),
      secondary: Color(0xfff7ecff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd3b5ff),
      onSecondaryContainer: Color(0xff13002f),
      tertiary: Color(0xfff6ecff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcdbaef),
      onTertiaryContainer: Color(0xff11022c),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff141318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff3eefc),
      outlineVariant: Color(0xffc5c1ce),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e8),
      inversePrimary: Color(0xff453d89),
      primaryFixed: Color(0xffe4dfff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc6bfff),
      onPrimaryFixedVariant: Color(0xff0d0048),
      secondaryFixed: Color(0xffecdcff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd6baff),
      onSecondaryFixedVariant: Color(0xff1a003d),
      tertiaryFixed: Color(0xffebdcff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffd1bef3),
      onTertiaryFixedVariant: Color(0xff170732),
      surfaceDim: Color(0xff141318),
      surfaceBright: Color(0xff514f55),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f24),
      surfaceContainer: Color(0xff313035),
      surfaceContainerHigh: Color(0xff3c3b40),
      surfaceContainerHighest: Color(0xff47464c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
