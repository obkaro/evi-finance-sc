import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _showQuickTransAssign =
        prefs.getBool('ff_showQuickTransAssign') ?? _showQuickTransAssign;
  }

  late SharedPreferences prefs;

  int _currencyTextField = 0;
  int get currencyTextField => _currencyTextField;
  set currencyTextField(int _value) {
    notifyListeners();

    _currencyTextField = _value;
  }

  String _dataSyncStatus = '';
  String get dataSyncStatus => _dataSyncStatus;
  set dataSyncStatus(String _value) {
    notifyListeners();

    _dataSyncStatus = _value;
  }

  bool _hasNewData = false;
  bool get hasNewData => _hasNewData;
  set hasNewData(bool _value) {
    notifyListeners();

    _hasNewData = _value;
  }

  String _dataSyncCode = '';
  String get dataSyncCode => _dataSyncCode;
  set dataSyncCode(String _value) {
    notifyListeners();

    _dataSyncCode = _value;
  }

  bool _dialogBoxReturn = false;
  bool get dialogBoxReturn => _dialogBoxReturn;
  set dialogBoxReturn(bool _value) {
    notifyListeners();

    _dialogBoxReturn = _value;
  }

  List<dynamic> _durations = [
    jsonDecode('{\"name\":\"Weekly\",\"duration\":7}'),
    jsonDecode('{\"name\":\"Monthly\",\"duration\":30}'),
    jsonDecode('{\"name\":\"Quarterly\",\"duration\":90}'),
    jsonDecode('{\"name\":\"Yearly\",\"duration\":365}')
  ];
  List<dynamic> get durations => _durations;
  set durations(List<dynamic> _value) {
    notifyListeners();

    _durations = _value;
  }

  void addToDurations(dynamic _value) {
    notifyListeners();
    _durations.add(_value);
  }

  void removeFromDurations(dynamic _value) {
    notifyListeners();
    _durations.remove(_value);
  }

  bool _hasUpdatePromptShown = false;
  bool get hasUpdatePromptShown => _hasUpdatePromptShown;
  set hasUpdatePromptShown(bool _value) {
    notifyListeners();

    _hasUpdatePromptShown = _value;
  }

  String _showCategoryOrSub = 'category';
  String get showCategoryOrSub => _showCategoryOrSub;
  set showCategoryOrSub(String _value) {
    notifyListeners();

    _showCategoryOrSub = _value;
  }

  bool _pageOverlayVisible = true;
  bool get pageOverlayVisible => _pageOverlayVisible;
  set pageOverlayVisible(bool _value) {
    notifyListeners();

    _pageOverlayVisible = _value;
  }

  bool _showQuickTransAssign = true;
  bool get showQuickTransAssign => _showQuickTransAssign;
  set showQuickTransAssign(bool _value) {
    notifyListeners();

    _showQuickTransAssign = _value;
    prefs.setBool('ff_showQuickTransAssign', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
