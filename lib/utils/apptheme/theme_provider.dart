import 'package:flutter/material.dart';
import 'package:flutterprovider/utils/app_shared_preferences.dart';
import 'package:flutterprovider/utils/apptheme/theme.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightMode;
  bool _isLightMode = true;
  String _modeText = 'Dark Mode OFF';

  ThemeData get themeData => _themeData;
  bool get isLightMode => _isLightMode;
  String get modeText => _modeText;

  ThemeProvider(){
    _loadThemeFromPreferences();
  }

  void _loadThemeFromPreferences() async {

    bool isLightMode = await AppSharedPreferences().getIsLightMode()?? true;

    if (isLightMode) {
      _themeData = lightMode;
      _modeText = 'Dark Mode OFF';
    } else {
      _themeData = darkMode;
      _modeText = 'Dark Mode ON';
    }
    _isLightMode = isLightMode;
    notifyListeners();
  }

  void toggleTheme()async{
    if(_themeData == lightMode){
      _themeData = darkMode;
      _isLightMode = false;
      _modeText = "Dark Mode ON";
    }else{
      _themeData = lightMode;
      _isLightMode = true;
      _modeText = 'Dark Mode OFF';
    }
    await AppSharedPreferences().setIsLightMode(_isLightMode);
    notifyListeners();
  }
}