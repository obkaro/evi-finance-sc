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
    _lastSignIn = prefs.containsKey('ff_lastSignIn')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_lastSignIn')!)
        : null;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _currencyTextField = 0;
  int get currencyTextField => _currencyTextField;
  set currencyTextField(int _value) {
    _currencyTextField = _value;
  }

  String _dataSyncStatus = '';
  String get dataSyncStatus => _dataSyncStatus;
  set dataSyncStatus(String _value) {
    _dataSyncStatus = _value;
  }

  bool _hasNewData = false;
  bool get hasNewData => _hasNewData;
  set hasNewData(bool _value) {
    _hasNewData = _value;
  }

  String _dataSyncCode = '';
  String get dataSyncCode => _dataSyncCode;
  set dataSyncCode(String _value) {
    _dataSyncCode = _value;
  }

  bool _dialogBoxReturn = false;
  bool get dialogBoxReturn => _dialogBoxReturn;
  set dialogBoxReturn(bool _value) {
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
    _durations = _value;
  }

  void addToDurations(dynamic _value) {
    _durations.add(_value);
  }

  void removeFromDurations(dynamic _value) {
    _durations.remove(_value);
  }

  bool _hasUpdatePromptShown = false;
  bool get hasUpdatePromptShown => _hasUpdatePromptShown;
  set hasUpdatePromptShown(bool _value) {
    _hasUpdatePromptShown = _value;
  }

  String _showCategoryOrSub = 'category';
  String get showCategoryOrSub => _showCategoryOrSub;
  set showCategoryOrSub(String _value) {
    _showCategoryOrSub = _value;
  }

  bool _pageOverlayVisible = true;
  bool get pageOverlayVisible => _pageOverlayVisible;
  set pageOverlayVisible(bool _value) {
    _pageOverlayVisible = _value;
  }

  bool _showQuickTransAssign = true;
  bool get showQuickTransAssign => _showQuickTransAssign;
  set showQuickTransAssign(bool _value) {
    _showQuickTransAssign = _value;
    prefs.setBool('ff_showQuickTransAssign', _value);
  }

  bool _paymentVerified = false;
  bool get paymentVerified => _paymentVerified;
  set paymentVerified(bool _value) {
    _paymentVerified = _value;
  }

  DateTime? _lastSignIn;
  DateTime? get lastSignIn => _lastSignIn;
  set lastSignIn(DateTime? _value) {
    _lastSignIn = _value;
    _value != null
        ? prefs.setInt('ff_lastSignIn', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastSignIn');
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
