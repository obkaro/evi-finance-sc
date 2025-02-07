// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

enum DeviceSize {
  mobile,
  tablet,
  desktop,
}

abstract class FlutterFlowTheme {
  static DeviceSize deviceSize = DeviceSize.mobile;

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

  static FlutterFlowTheme of(BuildContext context) {
    deviceSize = getDeviceSize(context);
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color eviredTransparent;
  late Color secondaryPrimary;
  late Color secondarySecondary;
  late Color lightPrimary;
  late Color gray600;
  late Color fadedDivider;
  late Color darkPrimary;
  late Color textColor;
  late Color shadowGray;

  String get title1Family => typography.title1Family;
  TextStyle get title1 => typography.title1;
  String get title2Family => typography.title2Family;
  TextStyle get title2 => typography.title2;
  String get title3Family => typography.title3Family;
  TextStyle get title3 => typography.title3;
  String get subtitle1Family => typography.subtitle1Family;
  TextStyle get subtitle1 => typography.subtitle1;
  String get subtitle2Family => typography.subtitle2Family;
  TextStyle get subtitle2 => typography.subtitle2;
  String get bodyText1Family => typography.bodyText1Family;
  TextStyle get bodyText1 => typography.bodyText1;
  String get bodyText2Family => typography.bodyText2Family;
  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => {
        DeviceSize.mobile: MobileTypography(this),
        DeviceSize.tablet: TabletTypography(this),
        DeviceSize.desktop: DesktopTypography(this),
      }[deviceSize]!;
}

DeviceSize getDeviceSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  if (width < 479) {
    return DeviceSize.mobile;
  } else if (width < 991) {
    return DeviceSize.tablet;
  } else {
    return DeviceSize.desktop;
  }
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFE70B54);
  late Color secondaryColor = const Color(0xFF293056);
  late Color tertiaryColor = const Color(0xFF1B998B);
  late Color alternate = const Color(0xFFFAA916);
  late Color primaryBackground = const Color(0xFFF2F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF101323);
  late Color secondaryText = const Color(0xFF7F8295);

  late Color eviredTransparent = Color(0x28FF0054);
  late Color secondaryPrimary = Color(0xFFECECEC);
  late Color secondarySecondary = Color(0xFFCECECE);
  late Color lightPrimary = Color(0xFFFAFAFA);
  late Color gray600 = Color(0xFF262D34);
  late Color fadedDivider = Color(0xFFDDDDDD);
  late Color darkPrimary = Color(0xFFFFF2F5);
  late Color textColor = Color(0xFF1E2429);
  late Color shadowGray = Color(0x13000000);
}

abstract class Typography {
  String get title1Family;
  TextStyle get title1;
  String get title2Family;
  TextStyle get title2;
  String get title3Family;
  TextStyle get title3;
  String get subtitle1Family;
  TextStyle get subtitle1;
  String get subtitle2Family;
  TextStyle get subtitle2;
  String get bodyText1Family;
  TextStyle get bodyText1;
  String get bodyText2Family;
  TextStyle get bodyText2;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Work Sans';
  TextStyle get title1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title2Family => 'Work Sans';
  TextStyle get title2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  String get title3Family => 'Work Sans';
  TextStyle get title3 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );
  String get subtitle1Family => 'Work Sans';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  String get subtitle2Family => 'Work Sans';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
  String get bodyText1Family => 'Work Sans';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  String get bodyText2Family => 'Work Sans';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      );
}

class TabletTypography extends Typography {
  TabletTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Work Sans';
  TextStyle get title1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title2Family => 'Work Sans';
  TextStyle get title2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  String get title3Family => 'Work Sans';
  TextStyle get title3 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  String get subtitle1Family => 'Work Sans';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  String get subtitle2Family => 'Work Sans';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  String get bodyText1Family => 'Work Sans';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
  String get bodyText2Family => 'Work Sans';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
}

class DesktopTypography extends Typography {
  DesktopTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Work Sans';
  TextStyle get title1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  String get title2Family => 'Work Sans';
  TextStyle get title2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  String get title3Family => 'Work Sans';
  TextStyle get title3 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      );
  String get subtitle1Family => 'Work Sans';
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  String get subtitle2Family => 'Work Sans';
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
  String get bodyText1Family => 'Work Sans';
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
  String get bodyText2Family => 'Work Sans';
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Work Sans',
        color: theme.secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFFF0054);
  late Color secondaryColor = const Color(0xFF101323);
  late Color tertiaryColor = const Color(0xFF1B998B);
  late Color alternate = const Color(0xFFFAA916);
  late Color primaryBackground = const Color(0xFF1B1B1E);
  late Color secondaryBackground = const Color(0xFF1F1F22);
  late Color primaryText = const Color(0xFFE0E0E0);
  late Color secondaryText = const Color(0xFF8C8D97);

  late Color eviredTransparent = Color(0x2AFF0054);
  late Color secondaryPrimary = Color(0xFFECECEC);
  late Color secondarySecondary = Color(0xFFCECECE);
  late Color lightPrimary = Color(0xFF1D1D1F);
  late Color gray600 = Color(0xFF262D34);
  late Color fadedDivider = Color(0xFF2B2B2B);
  late Color darkPrimary = Color(0xFF370D1B);
  late Color textColor = Color(0xFF1E2429);
  late Color shadowGray = Color(0x0A000000);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
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
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
