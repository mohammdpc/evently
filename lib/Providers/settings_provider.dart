import 'package:evently/Authentication/login/log_in.dart';
import 'package:evently/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:evently/models/user.dart';

class SettingsProvider extends ChangeNotifier {
  static bool _en = true;
  static bool _light = true;
  static bool _onboarding = true;
  static bool _registered = false;
  UserModel? user;
  String userEmail = '';
  late SharedPreferences _db;

  bool get language => _en;
  bool get theme => _light;
  bool get onboarding => _onboarding;
  String get userID => user!.userID;
  String get userName => user!.userName;
  List<Event>? get userEvents => user!.events;

  SettingsProvider(SharedPreferences db) {
    _db = db;
    _en = _db.getBool('Language') ?? true;
    _light = _db.getBool('Theme') ?? true;
    _onboarding = _db.getBool('onBoarding') ?? true;
    _registered = db.getBool('registered') ?? false;
    if (_db.getString('UserID') != null) {
      user = UserModel(userID: _db.getString('UserID')!);
    }
    notifyListeners();
  }

  void themeToDark() {
    if (_light) {
      _light = false;
      _db.setBool('Theme', false);
      notifyListeners();
    }
  }

  void themeToLight() {
    if (!_light) {
      _light = true;
      _db.setBool('Theme', true);
      notifyListeners();
    }
  }

  void themeSwitch() {
    _light = !_light;
    notifyListeners();
  }

  void languageToEN() {
    if (!_en) {
      _en = true;
      _db.setBool('Language', true);
      notifyListeners();
    }
  }

  void languageToAR() {
    if (_en) {
      _en = false;
      _db.setBool('Language', false);
      notifyListeners();
    }
  }

  void languageSwitch() {
    _en = !_en;
    notifyListeners();
  }

  void onBoarding() {
    _db.setBool('onBoarding', false);
    _onboarding = false;
  }

  void saveUser() {
    _db.setString('UserID', user!.userID);
    _db.setString('User Name', user!.userName);
    _db.setBool('registered', true);
    notifyListeners();
  }

  void deleteUser(BuildContext context) {
    _db.remove('UserID');
    _db.remove('User Name');
    _db.remove('registered');
    userEmail = '';
    user = null;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => LogInScreen(),
      ),
      ModalRoute.withName('/'),
    );
  }
}

late SettingsProvider setting;
