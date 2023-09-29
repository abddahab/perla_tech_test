import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/color/color_manger.dart';

final ThemeData darkMode = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: ColorManger.darkModeColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManger.primaryDarkModeColor,
      textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp , color: ColorManger.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ColorManger.primaryDarkModeColor ,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp , color: ColorManger.white),
      )
  ),

  brightness: Brightness.dark,
  dividerColor: ColorManger.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.sp ,
      fontWeight: FontWeight.w500,
      color: ColorManger.primaryDarkModeColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp ,
      fontWeight: FontWeight.w500,
      color: ColorManger.lightGry,
    ),
    headlineMedium:TextStyle(
      fontSize: 14.sp ,
      fontWeight: FontWeight.w400,
      color: ColorManger.lightGry,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ColorManger.white,
    ),
    labelSmall: TextStyle(
      fontSize: 6.sp,
      fontWeight: FontWeight.w400,
      color: ColorManger.white,
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(borderSide:BorderSide(color: ColorManger.borderColor) , borderRadius: BorderRadius.all(Radius.circular(8.r)) ),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color:  ColorManger.red)),
    fillColor: ColorManger.borderColor,
    labelStyle: TextStyle(
      fontSize: 16.sp ,
      fontWeight: FontWeight.w500,
      color: ColorManger.gry,
    ),
    prefixIconColor: ColorManger.darkGry,
    suffixIconColor: ColorManger.darkGry,
  ),
);
