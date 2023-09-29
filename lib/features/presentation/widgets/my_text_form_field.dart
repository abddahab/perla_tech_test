import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  void Function(String)? onChanged;
  void Function()? onTap;
  bool? isPassword;
  final String? Function(String?)? validate;
  final String lable;
  IconData? prefix;
  IconData? suffix ;
  void Function()? suffixPressed;
  double? width ;

  MyTextFormField({
    required this.controller,
    required this.keyboardType,
    this.onChanged,
    this.onTap,
    this.isPassword,
    required this.validate,
    required this.lable,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.width,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller ,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onTap: onTap,
        validator: validate,
        obscureText: isPassword??  false,
        decoration:InputDecoration(
          labelText: lable,
          prefixIcon: Icon(prefix) ,
          suffixIcon: suffix != null? IconButton(icon: Icon(suffix),onPressed:suffixPressed ,) : null,
          contentPadding: EdgeInsets.symmetric(vertical: 14.w , horizontal: 52.h),
        )
    ).whithSize(width: 342.w, height: 48.h) ;
  }
}

extension CustomTextFormField on TextFormField{
  Widget whithSize ({required double width , required double height}){
    return Container(
      width:  ScreenUtil().setWidth(width),
      height: ScreenUtil().setHeight(height),
      child: this,
    );
  }
}