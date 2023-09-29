import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/color/color_manger.dart';


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
        color: ColorManger.primary,
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
      ),

      child: ElevatedButton(
        onPressed:onPressed,
        child: Text('${text}',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}
