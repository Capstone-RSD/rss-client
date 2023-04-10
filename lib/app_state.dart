import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
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
    secureStorage = FlutterSecureStorage();
    if (await secureStorage.read(key: 'ff_authCred') != null) {
      try {
        _authCred =
            jsonDecode(await secureStorage.getString('ff_authCred') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  dynamic _authCred = jsonDecode('{\"name\":\"\",\"email\":\"\"}');
  dynamic get authCred => _authCred;
  set authCred(dynamic _value) {
    _authCred = _value;
    secureStorage.setString('ff_authCred', jsonEncode(_value));
  }

  void deleteAuthCred() {
    secureStorage.delete(key: 'ff_authCred');
  }

  bool _damageImage4 = true;
  bool get damageImage4 => _damageImage4;
  set damageImage4(bool _value) {
    _damageImage4 = _value;
  }

  bool _damageImage1 = true;
  bool get damageImage1 => _damageImage1;
  set damageImage1(bool _value) {
    _damageImage1 = _value;
  }

  bool _damageImage2 = true;
  bool get damageImage2 => _damageImage2;
  set damageImage2(bool _value) {
    _damageImage2 = _value;
  }

  bool _damageImage3 = true;
  bool get damageImage3 => _damageImage3;
  set damageImage3(bool _value) {
    _damageImage3 = _value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
