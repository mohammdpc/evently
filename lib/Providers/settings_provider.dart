import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
  static bool _en = true;
  static bool _light = true;
  static bool _onboarding = true;
  late SharedPreferences _db;

  bool get language=>_en;
  bool get theme=>_light;
  bool get onboarding=>_onboarding;

  SettingsProvider(SharedPreferences db){
    _db = db;
    _en = _db.getBool('Language')??true;
    _light = _db.getBool('Theme')??true;
    _onboarding = _db.getBool('onBoarding')??true;
  }

  void themeToDark(){
    if(_light){
      _light=false;
      _db.setBool('Theme', false);
      notifyListeners();
    }
  }
  void themeToLight(){
    if(!_light){
      _light=true;
      _db.setBool('Theme', true);
      notifyListeners();
    }
  }

  void languageToEN(){
    if(!_en){
      _en=true;
      _db.setBool('Language', true);
      notifyListeners();
    }
  }
  void languageToAR(){
    if(_en){
      _en=false;
      _db.setBool('Language', false);
      notifyListeners();
    }
  }
  void onBoarding(){
    _db.setBool('onBoarding', false);
    _onboarding = false;
  }
}

late SettingsProvider setting;