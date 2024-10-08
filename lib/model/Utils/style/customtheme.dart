import 'package:flutter/material.dart';

// Define your light theme using ColorScheme
final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xffa73a00),
    surfaceTint: Color(0xffa73a00),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffff753b),
    onPrimaryContainer: Color(0xff260700),
    secondary: Color(0xff5d5f5f),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffffffff),
    onSecondaryContainer: Color(0xff575859),
    tertiary: Color(0xff5d5f5f),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffbfc0c0),
    onTertiaryContainer: Color(0xff303232),
    error: Color.fromARGB(255, 255, 0, 0),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffb61919),
    onErrorContainer: Color(0xffffffff),
    surface: Color(0xfffcf8f8),
    onSurface: Color(0xff1c1b1b),
    onSurfaceVariant: Color(0xff444748),
    outline: Color(0xff747878),
    outlineVariant: Color(0xffc4c7c7),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff313030),
    inversePrimary: Color(0xffffb59a),
    primaryFixed: Color(0xffffdbce),
    onPrimaryFixed: Color(0xff370e00),
    primaryFixedDim: Color(0xffffb59a),
    onPrimaryFixedVariant: Color(0xff802a00),
    secondaryFixed: Color(0xffe2e2e2),
    onSecondaryFixed: Color(0xff1a1c1c),
    secondaryFixedDim: Color(0xffc6c6c7),
    onSecondaryFixedVariant: Color(0xff454747),
    tertiaryFixed: Color(0xffe2e2e2),
    onTertiaryFixed: Color(0xff1a1c1c),
    tertiaryFixedDim: Color(0xffc6c7c6),
    onTertiaryFixedVariant: Color(0xff454747),
    surfaceDim: Color(0xffddd9d9),
    surfaceBright: Color(0xfffcf8f8),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff6f3f2),
    surfaceContainer: Color(0xfff1edec),
    surfaceContainerHigh: Color(0xffebe7e7),
    surfaceContainerHighest: Color(0xffe5e2e1),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffa73a00),
    foregroundColor: Color(0xffffffff),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFFF5B00),
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
);

// Define your dark theme using ColorScheme
final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xffffb59a),
    surfaceTint: Color(0xffffb59a),
    onPrimary: Color(0xff5a1b00),
    primaryContainer: Color(0xffcd4800),
    onPrimaryContainer: Color(0xffffffff),
    secondary: Color(0xffffffff),
    onSecondary: Color(0xff2f3131),
    secondaryContainer: Color(0xffd4d4d4),
    onSecondaryContainer: Color(0xff3e4040),
    tertiary: Color(0xffdadada),
    onTertiary: Color(0xff2f3131),
    tertiaryContainer: Color(0xffb0b1b1),
    onTertiaryContainer: Color(0xff242626),
    error: Color.fromARGB(255, 255, 25, 0),
    onError: Color(0xff690005),
    errorContainer: Color(0xff8f0009),
    onErrorContainer: Color(0xffffd3cd),
    surface: Color(0xff141313),
    onSurface: Color(0xffe5e2e1),
    onSurfaceVariant: Color(0xffc4c7c7),
    outline: Color(0xff8e9192),
    outlineVariant: Color(0xff444748),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffe5e2e1),
    inversePrimary: Color(0xffa73a00),
    primaryFixed: Color(0xffffdbce),
    onPrimaryFixed: Color(0xff370e00),
    primaryFixedDim: Color(0xffffb59a),
    onPrimaryFixedVariant: Color(0xff802a00),
    secondaryFixed: Color(0xffe2e2e2),
    onSecondaryFixed: Color(0xff1a1c1c),
    secondaryFixedDim: Color(0xffc6c6c7),
    onSecondaryFixedVariant: Color(0xff454747),
    tertiaryFixed: Color(0xffe2e2e2),
    onTertiaryFixed: Color(0xff1a1c1c),
    tertiaryFixedDim: Color(0xffc6c7c6),
    onTertiaryFixedVariant: Color(0xff454747),
    surfaceDim: Color(0xff141313),
    surfaceBright: Color(0xff3a3939),
    surfaceContainerLowest: Color(0xff0e0e0e),
    surfaceContainerLow: Color(0xff1c1b1b),
    surfaceContainer: Color(0xff201f1f),
    surfaceContainerHigh: Color(0xff2a2a2a),
    surfaceContainerHighest: Color(0xff353434),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffffb59a),
    foregroundColor: Color(0xff5a1b00),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFFFF5B00),
    textTheme: ButtonTextTheme.primary,
  ),
  scaffoldBackgroundColor: const Color(0xff141313),
);
