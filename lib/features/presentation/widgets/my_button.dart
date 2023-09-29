import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MyButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  double? width;
  MyButton({
    required this.onPressed,
    required this.text,
    this.width,
  });
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 48.h,
      width: width?? 342.w,
      decoration: BoxDecoration(
        color: Color(0xFF6C63FF),
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),

      child: ElevatedButton(
        onPressed:onPressed,
        child: Text('${text}',
          style: TextStyle(fontSize: 16.sp ,fontWeight: FontWeight.w500 , color: Color(0xFFFFFFFF)),),
      ),
    );
  }
}
