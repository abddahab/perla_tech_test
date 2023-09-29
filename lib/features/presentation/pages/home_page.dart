import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/color/color_manger.dart';
import 'package:perla_tech/features/presentation/widgets/my_button.dart';
import 'package:perla_tech/features/presentation/widgets/my_drawer.dart';
import 'package:perla_tech/features/presentation/widgets/my_note_item.dart';
import 'package:perla_tech/features/presentation/widgets/my_text_form_field.dart';

import '../../../core/strings/app_strings.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
   var _textController = TextEditingController();

   var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: MyDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(height: 48.h,),
            IconButton(
                onPressed:(){
                  scaffoldKey.currentState?.openDrawer();
                } ,
                icon:Icon(Icons.menu)),
            SizedBox(height: 32.h,),
            Row(
              children: [
                MyTextFormField(
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    validate: (value){
                      return null;
                    },
                    lable:  AppStrings.enterYourText,
                    width:250.w ,
                ),
                SizedBox(width: 8.w,),
                MyButton(
                  onPressed: (){},
                  text:  AppStrings.add,
                  width: 80.w,
                ),
              ],
            ),
            SizedBox(height: 32.h,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 40.h,
                    color: ColorManger.lightGry,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24 , top: 12 , bottom: 12),
                      child: Text(
                        AppStrings.text ,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  )
                ),
                Expanded(
                  flex: 1,
                child: Container(
                  height: 40.h,
                  color: ColorManger.lightGry,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24 , top: 12 , bottom: 12),
                    child: Text(
                      AppStrings.date ,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                )
                ),
              ],
            ),
            MyNoteItem(),
          ],
        ),
      ),
    );
  }
}
