import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/color/color_manger.dart';

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: ColorManger.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: ColorManger.primary ,
        textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp , color: ColorManger.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp , color: ColorManger.white),
    )
  ),
  brightness: Brightness.light,
  dividerColor: ColorManger.dividerColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 24.sp ,
      fontWeight: FontWeight.w500,
      color: ColorManger.primary,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.sp ,
      fontWeight: FontWeight.w500,
      color: ColorManger.darkGry,
    ),
    titleMedium:TextStyle(
      fontSize: 14.sp ,
      fontWeight: FontWeight.w400,
      color: ColorManger.black,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ColorManger.black,
    ),
    labelSmall: TextStyle(
      fontSize: 6.sp,
      fontWeight: FontWeight.w400,
      color: ColorManger.black,
    ),
    displayMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: ColorManger.darkGry,
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
