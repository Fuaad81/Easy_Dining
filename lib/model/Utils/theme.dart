import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4289149440),
      surfaceTint: Color(4289149440),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294931771),
      onPrimaryContainer: Color(4280682240),
      secondary: Color(4284309343),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294967295),
      onSecondaryContainer: Color(4283914329),
      tertiary: Color(4284309343),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4290756800),
      onTertiaryContainer: Color(4281348658),
      error: Color(4286119943),
      onError: Color(4294967295),
      errorContainer: Color(4290124057),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282664776),
      outline: Color(4285823096),
      outlineVariant: Color(4291086279),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4294948250),
      primaryFixed: Color(4294958030),
      onPrimaryFixed: Color(4281798144),
      primaryFixedDim: Color(4294948250),
      onPrimaryFixedVariant: Color(4286589440),
      secondaryFixed: Color(4293059298),
      onSecondaryFixed: Color(4279901212),
      secondaryFixedDim: Color(4291217095),
      onSecondaryFixedVariant: Color(4282730311),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279901212),
      tertiaryFixedDim: Color(4291217350),
      onTertiaryFixedVariant: Color(4282730311),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374386),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  // static ColorScheme lightMediumContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.light,
  //     primary: Color(4286130176),
  //     surfaceTint: Color(4289149440),
  //     onPrimary: Color(4294967295),
  //     primaryContainer: Color(4291643392),
  //     onPrimaryContainer: Color(4294967295),
  //     secondary: Color(4282467139),
  //     onSecondary: Color(4294967295),
  //     secondaryContainer: Color(4285756789),
  //     onSecondaryContainer: Color(4294967295),
  //     tertiary: Color(4282467139),
  //     onTertiary: Color(4294967295),
  //     tertiaryContainer: Color(4285756789),
  //     onTertiaryContainer: Color(4294967295),
  //     error: Color(4286119943),
  //     onError: Color(4294967295),
  //     errorContainer: Color(4290124057),
  //     onErrorContainer: Color(4294967295),
  //     surface: Color(4294768888),
  //     onSurface: Color(4280032027),
  //     onSurfaceVariant: Color(4282401604),
  //     outline: Color(4284244064),
  //     outlineVariant: Color(4286086012),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4281413680),
  //     inversePrimary: Color(4294948250),
  //     primaryFixed: Color(4291643392),
  //     onPrimaryFixed: Color(4294967295),
  //     primaryFixedDim: Color(4288886784),
  //     onPrimaryFixedVariant: Color(4294967295),
  //     secondaryFixed: Color(4285756789),
  //     onSecondaryFixed: Color(4294967295),
  //     secondaryFixedDim: Color(4284111964),
  //     onSecondaryFixedVariant: Color(4294967295),
  //     tertiaryFixed: Color(4285756789),
  //     onTertiaryFixed: Color(4294967295),
  //     tertiaryFixedDim: Color(4284111964),
  //     onTertiaryFixedVariant: Color(4294967295),
  //     surfaceDim: Color(4292729305),
  //     surfaceBright: Color(4294768888),
  //     surfaceContainerLowest: Color(4294967295),
  //     surfaceContainerLow: Color(4294374386),
  //     surfaceContainer: Color(4294045164),
  //     surfaceContainerHigh: Color(4293650407),
  //     surfaceContainerHighest: Color(4293255905),
  //   );
  // }

  // ThemeData lightMediumContrast() {
  //   return theme(lightMediumContrastScheme());
  // }

  // static ColorScheme lightHighContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.light,
  //     primary: Color(4282585600),
  //     surfaceTint: Color(4289149440),
  //     onPrimary: Color(4294967295),
  //     primaryContainer: Color(4286130176),
  //     onPrimaryContainer: Color(4294967295),
  //     secondary: Color(4280296227),
  //     onSecondary: Color(4294967295),
  //     secondaryContainer: Color(4282467139),
  //     onSecondaryContainer: Color(4294967295),
  //     tertiary: Color(4280296227),
  //     onTertiary: Color(4294967295),
  //     tertiaryContainer: Color(4282467139),
  //     onTertiaryContainer: Color(4294967295),
  //     error: Color(4283301891),
  //     onError: Color(4294967295),
  //     errorContainer: Color(4287365129),
  //     onErrorContainer: Color(4294967295),
  //     surface: Color(4294768888),
  //     onSurface: Color(4278190080),
  //     onSurfaceVariant: Color(4280362277),
  //     outline: Color(4282401604),
  //     outlineVariant: Color(4282401604),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4281413680),
  //     inversePrimary: Color(4294961119),
  //     primaryFixed: Color(4286130176),
  //     onPrimaryFixed: Color(4294967295),
  //     primaryFixedDim: Color(4283701504),
  //     onPrimaryFixedVariant: Color(4294967295),
  //     secondaryFixed: Color(4282467139),
  //     onSecondaryFixed: Color(4294967295),
  //     secondaryFixedDim: Color(4281019693),
  //     onSecondaryFixedVariant: Color(4294967295),
  //     tertiaryFixed: Color(4282467139),
  //     onTertiaryFixed: Color(4294967295),
  //     tertiaryFixedDim: Color(4281019693),
  //     onTertiaryFixedVariant: Color(4294967295),
  //     surfaceDim: Color(4292729305),
  //     surfaceBright: Color(4294768888),
  //     surfaceContainerLowest: Color(4294967295),
  //     surfaceContainerLow: Color(4294374386),
  //     surfaceContainer: Color(4294045164),
  //     surfaceContainerHigh: Color(4293650407),
  //     surfaceContainerHighest: Color(4293255905),
  //   );
  // }

  // ThemeData lightHighContrast() {
  //   return theme(lightHighContrastScheme());
  // }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948250),
      surfaceTint: Color(4294948250),
      onPrimary: Color(4284095232),
      primaryContainer: Color(4291643392),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294967295),
      onSecondary: Color(4281282865),
      secondaryContainer: Color(4292138196),
      onSecondaryContainer: Color(4282269760),
      tertiary: Color(4292532954),
      onTertiary: Color(4281282865),
      tertiaryContainer: Color(4289769905),
      onTertiaryContainer: Color(4280559142),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287561737),
      onErrorContainer: Color(4294955981),
      surface: Color(4279505683),
      onSurface: Color(4293255905),
      onSurfaceVariant: Color(4291086279),
      outline: Color(4287533458),
      outlineVariant: Color(4282664776),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4289149440),
      primaryFixed: Color(4294958030),
      onPrimaryFixed: Color(4281798144),
      primaryFixedDim: Color(4294948250),
      onPrimaryFixedVariant: Color(4286589440),
      secondaryFixed: Color(4293059298),
      onSecondaryFixed: Color(4279901212),
      secondaryFixedDim: Color(4291217095),
      onSecondaryFixedVariant: Color(4282730311),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279901212),
      tertiaryFixedDim: Color(4291217350),
      onTertiaryFixedVariant: Color(4282730311),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  // static ColorScheme darkMediumContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: Color(4294949794),
  //     surfaceTint: Color(4294948250),
  //     onPrimary: Color(4281272832),
  //     primaryContainer: Color(4294728448),
  //     onPrimaryContainer: Color(4278190080),
  //     secondary: Color(4294967295),
  //     onSecondary: Color(4281282865),
  //     secondaryContainer: Color(4292138196),
  //     onSecondaryContainer: Color(4280164384),
  //     tertiary: Color(4292532954),
  //     onTertiary: Color(4280427813),
  //     tertiaryContainer: Color(4289769905),
  //     onTertiaryContainer: Color(4278190080),
  //     error: Color(4294949553),
  //     onError: Color(4281794561),
  //     errorContainer: Color(4294923337),
  //     onErrorContainer: Color(4278190080),
  //     surface: Color(4279505683),
  //     onSurface: Color(4294900473),
  //     onSurfaceVariant: Color(4291349452),
  //     outline: Color(4288717732),
  //     outlineVariant: Color(4286612612),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4293255905),
  //     inversePrimary: Color(4286720768),
  //     primaryFixed: Color(4294958030),
  //     onPrimaryFixed: Color(4280682240),
  //     primaryFixedDim: Color(4294948250),
  //     onPrimaryFixedVariant: Color(4284751616),
  //     secondaryFixed: Color(4293059298),
  //     onSecondaryFixed: Color(4279177490),
  //     secondaryFixedDim: Color(4291217095),
  //     onSecondaryFixedVariant: Color(4281611831),
  //     tertiaryFixed: Color(4293059298),
  //     onTertiaryFixed: Color(4279177746),
  //     tertiaryFixedDim: Color(4291217350),
  //     onTertiaryFixedVariant: Color(4281611831),
  //     surfaceDim: Color(4279505683),
  //     surfaceBright: Color(4282005817),
  //     surfaceContainerLowest: Color(4279111182),
  //     surfaceContainerLow: Color(4280032027),
  //     surfaceContainer: Color(4280295199),
  //     surfaceContainerHigh: Color(4280953386),
  //     surfaceContainerHighest: Color(4281676852),
  //   );
  // }

  // ThemeData darkMediumContrast() {
  //   return theme(darkMediumContrastScheme());
  // }

  // static ColorScheme darkHighContrastScheme() {
  //   return const ColorScheme(
  //     brightness: Brightness.dark,
  //     primary: Color(4294965752),
  //     surfaceTint: Color(4294948250),
  //     onPrimary: Color(4278190080),
  //     primaryContainer: Color(4294949794),
  //     onPrimaryContainer: Color(4278190080),
  //     secondary: Color(4294967295),
  //     onSecondary: Color(4278190080),
  //     secondaryContainer: Color(4292138196),
  //     onSecondaryContainer: Color(4278190080),
  //     tertiary: Color(4294638586),
  //     onTertiary: Color(4278190080),
  //     tertiaryContainer: Color(4291480523),
  //     onTertiaryContainer: Color(4278190080),
  //     error: Color(4294965753),
  //     onError: Color(4278190080),
  //     errorContainer: Color(4294949553),
  //     onErrorContainer: Color(4278190080),
  //     surface: Color(4279505683),
  //     onSurface: Color(4294967295),
  //     onSurfaceVariant: Color(4294507516),
  //     outline: Color(4291349452),
  //     outlineVariant: Color(4291349452),
  //     shadow: Color(4278190080),
  //     scrim: Color(4278190080),
  //     inverseSurface: Color(4293255905),
  //     inversePrimary: Color(4283438848),
  //     primaryFixed: Color(4294959318),
  //     onPrimaryFixed: Color(4278190080),
  //     primaryFixedDim: Color(4294949794),
  //     onPrimaryFixedVariant: Color(4281272832),
  //     secondaryFixed: Color(4293322727),
  //     onSecondaryFixed: Color(4278190080),
  //     secondaryFixedDim: Color(4291480523),
  //     onSecondaryFixedVariant: Color(4279506711),
  //     tertiaryFixed: Color(4293322727),
  //     onTertiaryFixed: Color(4278190080),
  //     tertiaryFixedDim: Color(4291480523),
  //     onTertiaryFixedVariant: Color(4279506711),
  //     surfaceDim: Color(4279505683),
  //     surfaceBright: Color(4282005817),
  //     surfaceContainerLowest: Color(4279111182),
  //     surfaceContainerLow: Color(4280032027),
  //     surfaceContainer: Color(4280295199),
  //     surfaceContainerHigh: Color(4280953386),
  //     surfaceContainerHighest: Color(4281676852),
  //   );
  // }

  // ThemeData darkHighContrast() {
  //   return theme(darkHighContrastScheme());
  // }


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


  List<ExtendedColor> get extendedColors => [
  ];
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
