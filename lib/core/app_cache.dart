import 'dart:ui';

import 'package:perla_tech/core/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache{

   Future<Locale> setAppLanguage() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();


     String currentLanguage = await getAppLanguage();
    if(currentLanguage == english){
      sharedPreferences.setString("language", arabic);
      return arabicLocal;
    }else{
      sharedPreferences.setString("language", english);
      return englishLocal;

    }
    // await sharedPreferences.setString("language", language);
  }

   Future<String> getAppLanguage() async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

     return sharedPreferences.getString("language") ?? '';
  }


  setAppMode(String mode) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString("mode", mode);

  }

  getMode()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.get("mode");
  }
}