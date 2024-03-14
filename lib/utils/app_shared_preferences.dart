import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences{

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // setter getter for theme or app mode "true/false"
  Future setIsLightMode(bool mode) async {
    await prefs.then((value) => value.setBool("appmode", mode));
  }

  Future getIsLightMode() async {
    return await prefs.then((value) => value.getBool("appmode"));
  }

}