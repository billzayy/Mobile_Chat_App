import 'package:flutter/material.dart';

//Light Theme
const kPrimaryLightColor = Colors.blue;
const kDividerColor = Color(0xFFF4F6FA);
const kTextFieldLightColor = Color(0xFFeff3f4);
const kCardLightColor = Color(0xFFf5f8fe);
const kBackgroundLight = Color(0xFFebf1f1);

//
const kDefaultBorderRadius = 5.0;
const kShadowColor = Color.fromRGBO(149, 157, 165, 0.2);
const kDefaultBoxShadow = BoxShadow(
  color: kShadowColor,
  offset: Offset(0, 8),
  blurRadius: 24,
);

class CoreTheme {
  static ThemeData get theme => _themeData;

  static final ThemeData _themeData = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0e86dc),
      onPrimary: Colors.white,
      primaryContainer: Colors.green,
      onPrimaryContainer: Colors.white,
      error: Color(0xffBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xffFFDAD6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xffFBFDF7),
      onBackground: Color(0xff191C19),
      secondary: Color(0xff4858A9),
      onSecondary: Colors.white,
      secondaryContainer: Color(0xffDEE1FF),
      onSecondaryContainer: Color(0xff00115A),
      surface: Color(0xffFBFDF7),
      onSurface: Color(0xff191C19),
      tertiary: Color(0xff3A646F),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xffffffff),
      onTertiaryContainer: Color(0xff001F26),
      surfaceVariant: Color(0xe8fafdfa),
      onSurfaceVariant: Color(0xff414941),
      outline: Color(0xffE8E8E8),
    ),
    // drawerTheme: const DrawerThemeData(
    //     backgroundColor: Colors.white, surfaceTintColor: Colors.blue),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    // scaffoldBackgroundColor: kPrimaryLightColor,
    // colorSchemeSeed: kPrimaryLightColor,
    brightness: Brightness.light,
    applyElevationOverlayColor: true,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      shadowColor: kShadowColor,
      scrolledUnderElevation: 2,
      centerTitle: true,
      color: Color(0xff0e86dc),
      actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
      iconTheme: IconThemeData(color: Colors.white),
      // backgroundColor: const Color(0xff0e86dc),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 1.3,
      ),
    ),
    cardTheme: CardTheme(
      // clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
      elevation: 1,
      color: Colors.grey.shade50,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        visualDensity: VisualDensity.compact,
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            fontWeight: FontWeight.bold,
            wordSpacing: 0,
            letterSpacing: 0,
            fontSize: 13,
          ),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kDefaultBorderRadius),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff0e86dc),

        // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    ),
  );
}
