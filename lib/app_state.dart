import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  late SharedPreferences prefs;

  int currencyTextField = 0;

  String dataSyncStatus = '';

  bool hasNewData = false;

  String dataSyncCode = '';

  bool dialogBoxReturn = false;

  List<dynamic> durations = [
    jsonDecode('{\"name\":\"Weekly\",\"duration\":7}'),
    jsonDecode('{\"name\":\"Monthly\",\"duration\":30}'),
    jsonDecode('{\"name\":\"Quarterly\",\"duration\":90}'),
    jsonDecode('{\"name\":\"Yearly\",\"duration\":365}')
  ];

  bool hasUpdatePromptShown = false;
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
