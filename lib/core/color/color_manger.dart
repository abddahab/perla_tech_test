import 'package:flutter/material.dart';

extension Hex16Color on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}



class ColorManger{
  static Color primary =  Hex16Color.fromHex("#6C63FF");
  static Color black =  Hex16Color.fromHex("#333333");
  static Color darkGry =  Hex16Color.fromHex("#B1B1B1");
  static Color lightGry =  Hex16Color.fromHex("#F5F5F5");
  static Color gry =  Hex16Color.fromHex("#C7C7C7");
  static Color red =  Hex16Color.fromHex("#FF5757");
  static Color white =  Hex16Color.fromHex("#FFFFFF");
  static Color dividerColor =  Hex16Color.fromHex("#F3F4F6CC");
  static Color borderColor =  Hex16Color.fromHex("#F5F5F5");
  static Color darkModeColor =  Hex16Color.fromHex("#3c3e3f");
  static Color primaryDarkModeColor =  Hex16Color.fromHex("#DC4D01");




}