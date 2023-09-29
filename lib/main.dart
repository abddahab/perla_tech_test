import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/language_manager.dart';
import 'package:perla_tech/core/router/router.dart';
import 'package:perla_tech/core/themes/app_theme.dart';
import 'package:perla_tech/core/themes/app_theme_dark.dart';

import 'core/app_cache.dart';
import 'features/presentation/bloc/note_bloc/note_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: supportedLocales,
      path: path,
      fallbackLocale: englishLocal,
      child: const MyApp()
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppCache appCache = AppCache();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appCache.getAppLanguage().then(
            (value) {
             if(value == arabic){
               context.setLocale(arabicLocal);
             }else{
               context.setLocale(englishLocal);
             }
            });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) =>
          BlocProvider(
            create: (context) => NoteBloc(),
            child: MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: lightTheme,
              debugShowCheckedModeBanner: false,
              routerConfig: AppRouter.router,
            ),
          ),
      designSize: Size(390, 844),
    );
  }
}