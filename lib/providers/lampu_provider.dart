import 'dart:convert';

import 'package:flutter/cupertino.dart';

class LampuProvider extends ChangeNotifier {
  bool _isHidup1 = false;
  bool _isHidup2 = false;
  bool _isHidup3 = false;
  bool _isHidup4 = false;
  bool _isFan = false;
  bool _isDoor = false;
  double _suhu = 0.0;
  int _humidity = 0;

  bool get isHidup1 => _isHidup1;
  bool get isHidup2 => _isHidup2;
  bool get isHidup3 => _isHidup3;
  bool get isHidup4 => _isHidup4;
  bool get isFan => _isFan;
  bool get isDoor => _isDoor;
  double get suhu => _suhu;
  int get humidity => _humidity;

  void statusLampu1(bool status) {
    _isHidup1 = status;
    notifyListeners();
  }

  void statusLampu2(bool status) {
    _isHidup2 = status;
    notifyListeners();
  }

  void statusLampu3(bool status) {
    _isHidup3 = status;
    notifyListeners();
  }

  void statusLampu4(bool status) {
    _isHidup4 = status;
    notifyListeners();
  }

  void statusfan(bool status) {
    _isFan = status;
    notifyListeners();
  }

  void statusDoor(bool status) {
    _isDoor = status;
    notifyListeners();
  }

  void setsuhu(double status) {
    _suhu = status;
    notifyListeners();
  }

  void sethumidity(int status) {
    _humidity = status;
    notifyListeners();
  }

  void refreshStatus(String data) {
    Map status = json.decode(data);
    _isHidup1 = status['led'][0] == 1;
    _isHidup2 = status['led'][1] == 1;
    _isHidup3 = status['led'][2] == 1;
    _isHidup4 = status['led'][3] == 1;
    _isFan = status['led'][4] == 1;
    _isDoor = status['door'] == "1";
    _suhu = double.parse(status['temperature'].toString());
    _humidity = int.parse(status['humidity'].toString());
    notifyListeners();
  }
}
