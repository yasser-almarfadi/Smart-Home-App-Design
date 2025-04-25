import 'package:flutter/material.dart';
import 'package:myproject/src/domain/helper/extended_color.dart';
import 'package:myproject/src/domain/helper/material_scheme.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static const Color primaryColor = Color(0xFF000000);
  // static const Color primaryColor = Color(0xFF004823);
  // static const Color secondaryColor = Color(0xFFB1A500);
  static const Color secondaryColor = Color(0xFFDCE1E8);
  // static const Color secondaryColor = Color(0xFFFFFF00);
  // static const Color secondaryColor = Color(0xFFB0B0B0);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      surfaceTint: Color(0xFFEAEAEA),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFFFFFF),
      onPrimaryContainer: Color(0xFF000000),
      secondary: secondaryColor,
      onSecondary: Color(0xFF303233),
      secondaryContainer: Color(0xFFEAEAEA),
      onSecondaryContainer: Color(0xFF333333),
      tertiary: Color(
          0xFFE57373), // Example tertiary color, replace with your preference
      onTextFieldTertiary: Color(0xFFFFFFFF),
      textFieldTertiaryContainer: Color(0xFFCCCCCC),
      onTextFieldTertiaryContainer: Color(0xFF333333),
      error: Color(
          0xFFB00020), // Example error color, replace with your preference
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFCF6679),
      onErrorContainer: Color(0xFFBF4657),
      background: Color(0xFFF6F8FC),
      onBackground: Color(0xFF000000),
      surface: Color(0xFFF2F5FA),
      onSurface: Color(0xFF9E9E9E),
      surfaceVariant: Color(0xFFE0E0E0),
      onSurfaceVariant: Color(0xFF333333),
      outline: Color(0xFF000000),
      outlineVariant: Color(0xFF333333),
      shadow: Color(0x1F000000),
      scrim: Color(0x33000000),
      inverseSurface: Color(0xFF333333),
      inverseOnSurface: Color(0xFFFFFFFF),
      inversePrimary: Color(
          0xFF5F27B0), // Example inverse primary color, replace with your preference
      primaryFixed: Color(0xFFEEEEEE),
      onPrimaryFixed: Color(0xFF000000),
      primaryFixedDim: Color(0x8A000000),
      onPrimaryFixedVariant: Color(0xFF1A73E8),
      secondaryFixed: Color(0xFF8A05BE),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0x8A000000),
      onSecondaryFixedVariant: Color(0xFF03DAC6),
      tertiaryFixed: Color(0xFFEF6C00),
      onTertiaryFixed: Color(0xFF000000),
      tertiaryFixedDim: Color(0x8A000000),
      onTertiaryFixedVariant: Color(0xFF6200EE),
      surfaceDim: Color(0xFFAAAAAA),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0x00000000),
      surfaceContainerLow: Color(0x14000000),
      surfaceContainer: Color(0x1F000000),
      surfaceContainerHigh: Color(0x33000000),
      surfaceContainerHighest: Color(0x4D000000),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF54301D),
      surfaceTint: Color(0xFF333333),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF555555),
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFF1F0D3A),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF444444),
      onSecondaryContainer: Color(0xFFFFFFFF),
      tertiary: Color(
          0xFFE57373), // Example tertiary color, replace with your preference
      onTextFieldTertiary: Color(0xFFFFFFFF),
      textFieldTertiaryContainer: Color(0xFFCCCCCC),
      onTextFieldTertiaryContainer: Color(0xFF333333),
      error: Color(0xFFCF6679),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFB00020),
      onErrorContainer: Color(0xFFBF4657),
      background: Color(0xFF000000),
      onBackground: Color(0xFFFFFFFF),
      surface: Color(0xFF121212),
      onSurface: Color(0xFFFFFFFF),
      surfaceVariant: Color(0xFF1E1E1E),
      onSurfaceVariant: Color(0xFFBDBDBD),
      outline: Color(0xFF333333),
      outlineVariant: Color(0xFF1E1E1E),
      shadow: Color(0x1F000000),
      scrim: Color(0x33000000),
      inverseSurface: Color(0xFF1E1E1E),
      inverseOnSurface: Color(0xFFFFFFFF),
      inversePrimary: Color.fromARGB(255, 60, 28, 104),
      primaryFixed: Color(0xFF424242),
      onPrimaryFixed: Color(0xFFFFFFFF),
      primaryFixedDim: Color(0x8A000000),
      onPrimaryFixedVariant: Color(0xFF1A73E8),
      secondaryFixed: Color(0xFF651FFF),
      onSecondaryFixed: Color(0xFFFFFFFF),
      secondaryFixedDim: Color(0x8A000000),
      onSecondaryFixedVariant: Color(0xFF03DAC6),
      tertiaryFixed: Color(0xFFFF6D00),
      onTertiaryFixed: Color(0xFFFFFFFF),
      tertiaryFixedDim: Color(0x8A000000),
      onTertiaryFixedVariant: Color(0xFF6200EE),
      surfaceDim: Color(0xFF333333),
      surfaceBright: Color(0xFF121212),
      surfaceContainerLowest: Color(0x00000000),
      surfaceContainerLow: Color(0x14000000),
      surfaceContainer: Color(0x1F000000),
      surfaceContainerHigh: Color(0x33000000),
      surfaceContainerHighest: Color(0x4D000000),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}
