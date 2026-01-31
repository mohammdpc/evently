import 'package:flutter/cupertino.dart';

class SettingsProvider extends ChangeNotifier{
  static bool _en = true;
  static bool _light = true;

  bool get language=>_en;
  bool get theme=>_light;

  void switchLanguage(){
    _en=!_en;
    notifyListeners();
  }

  void themeToDark(){
    if(_light){
      _light=false;
      notifyListeners();
    }
  }
  void themeToLight(){
    if(!_light){
      _light=true;
      notifyListeners();
    }
  }

  void languageToEN(){
    if(!_en){
      _en=true;
      notifyListeners();
    }
  }
  void languageToAR(){
    if(_en){
      _en=false;
      notifyListeners();
    }
  }
}

SettingsProvider setting = SettingsProvider();