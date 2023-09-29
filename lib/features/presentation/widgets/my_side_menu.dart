import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MySideMenu extends StatelessWidget {
  const MySideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu)),
          SizedBox(height: 25,),

          Row(children: [
            Icon(Icons.brightness_4_sharp),
            Text("Dark Mode", style: TextStyle(fontSize: 14.sp , fontWeight: FontWeight.w400 , color: Color(0xFF333333)),),
            IconButton(
                onPressed: (){}, icon: Icon(Icons.smart_button_outlined)),
          ],),
          SizedBox(height: 25,),
          Row(children: [
            Icon(Icons.language_outlined),
            TextButton(
                onPressed: (){},
                child: Text("english/arabic")),
          ],),
          SizedBox(height: 25,),
          Row(
            children: [
              Icon(Icons.logout),
              TextButton(
                  onPressed: (){},
                  child: Text("log out")),
            ],
          ),
          
        ],
      ),
    );
  }
}
