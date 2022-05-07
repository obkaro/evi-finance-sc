// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? DarkModeTheme()
          : LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  Color customColor1;

  TextStyle get title1 => TextStyle(
        fontFamily: 'Spline Sans',
        color: primaryText,
        fontWeight: FontWeight.w900,
        fontSize: 24,
      );
  TextStyle get title2 => TextStyle(
        fontFamily: 'Spline Sans',
        color: secondaryText,
        fontWeight: FontWeight.w800,
        fontSize: 22,
      );
  TextStyle get title3 => TextStyle(
        fontFamily: 'Spline Sans',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Source Sans Pro',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFFF0054);
  Color secondaryColor = const Color(0xFF1B2124);
  Color tertiaryColor = const Color(0xFF1B998B);
  Color alternate = const Color(0xFFFAA916);
  Color primaryBackground = const Color(0xFFD2D2D2);
  Color secondaryBackground = const Color(0xC0FFFFFF);
  Color primaryText = const Color(0xFF292728);
  Color secondaryText = const Color(0xFF504E4F);

  Color customColor1 = Color(0x28FF0054);
}

class DarkModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFFF0054);
  Color secondaryColor = const Color(0xFF494949);
  Color tertiaryColor = const Color(0xFF1B998B);
  Color alternate = const Color(0xFFFAA916);
  Color primaryBackground = const Color(0xFF1A1A1A);
  Color secondaryBackground = const Color(0x3F000000);
  Color primaryText = const Color(0xFFF0F0F0);
  Color secondaryText = const Color(0xFFC2C2C2);

  Color customColor1 = Color(0x2AFF0054);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
