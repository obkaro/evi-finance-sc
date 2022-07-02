// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

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

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color eviredTransparent;
  late Color neutralGray;

  TextStyle get title1 => TextStyle(
        fontFamily: 'Spline Sans',
        color: primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  TextStyle get title2 => TextStyle(
        fontFamily: 'Spline Sans',
        color: secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
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
        fontSize: 12,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFFF0054);
  late Color secondaryColor = const Color(0xFF1B2124);
  late Color tertiaryColor = const Color(0xFF1B998B);
  late Color alternate = const Color(0xFFFAA916);
  late Color primaryBackground = const Color(0xFFF5F5F5);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF262626);
  late Color secondaryText = const Color(0xFF595959);

  late Color eviredTransparent = Color(0x28FF0054);
  late Color neutralGray = Color(0xFF747474);
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFFF0054);
  late Color secondaryColor = const Color(0xFF494949);
  late Color tertiaryColor = const Color(0xFF1B998B);
  late Color alternate = const Color(0xFFFAA916);
  late Color primaryBackground = const Color(0xFF151515);
  late Color secondaryBackground = const Color(0xFF1D1D1D);
  late Color primaryText = const Color(0xFFE0E0E0);
  late Color secondaryText = const Color(0xFFD2D2D2);

  late Color eviredTransparent = Color(0x2AFF0054);
  late Color neutralGray = Color(0xFF747474);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
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
