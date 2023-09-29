import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/app_cache.dart';
import 'package:perla_tech/core/strings/app_strings.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48.h,),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.menu)),
            SizedBox(height: 25,),

            Row(children: [
              Icon(Icons.brightness_4_sharp),
              Text(AppStrings().darkMode, style:Theme.of(context).textTheme.titleMedium),
              IconButton(
                  onPressed: (){}, icon: Icon(Icons.smart_button_outlined)),
            ],),
            SizedBox(height: 25,),
            Row(children: [
              Icon(Icons.language_outlined),
              TextButton(
                  onPressed: () async {

                    Locale locale = await  AppCache().setAppLanguage();
                    if(mounted) {
                      context.setLocale(locale);
                    }

                  },
                  child: Text(AppStrings().arabicEnglish , style: Theme.of(context).textTheme.titleMedium, )
              ),
            ],),
            SizedBox(height: 25,),
            Row(
              children: [
                Icon(Icons.logout),
                TextButton(
                    onPressed: (){},
                    child: Text(AppStrings().logout , style: Theme.of(context).textTheme.titleMedium,)),
              ],
            ),

          ],
        ),
      ),

    );
  }
}
