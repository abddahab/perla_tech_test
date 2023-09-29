import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:perla_tech/core/router/router.dart';
import 'package:perla_tech/features/presentation/pages/home_page.dart';
import 'package:perla_tech/features/presentation/pages/register_page.dart';

import 'login_page.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()async{
    await Future.delayed(Duration(seconds: 1),(){});
    context.goNamed(AppRouter.home);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage("assets/images/logo.png")),
      ),
    );
  }
}
