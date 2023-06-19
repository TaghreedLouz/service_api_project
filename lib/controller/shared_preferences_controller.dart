import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController{

  late SharedPreferences prefs;
  static SharedPreferencesController? instance;

  SharedPreferencesController._initialize();

  factory SharedPreferencesController(){
    return instance ??= SharedPreferencesController._initialize();
  }

  getInitialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  setData({key, value}){
    if(value is int){
      prefs.setInt(key, value);
    }else if(value is String){
      prefs.setString(key, value);

    }else if(value is bool){
      prefs.setBool(key, value);

    }else if(value is double){
      prefs.setDouble(key, value);
    }
  }

  G getData<G>(key){
    return prefs.get(key) as G;
  }
}