import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{
  static final SharedPref _sharedPref = SharedPref._internal();
  SharedPreferences? sharedPreferences;
  factory SharedPref(){
    return _sharedPref;
  }

  SharedPref._internal();

  Future init() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
  }

  void setString(String key, String value){
    sharedPreferences!.setString(key, value);
  }

  String getString(String key){
    return sharedPreferences!.getString(key) ?? "";
  }

  void setBoolean(String key, bool value){
    sharedPreferences!.setBool(key, value);
  }

  bool getBoolean(String key){
    return sharedPreferences!.getBool(key) ?? false;
  }

}