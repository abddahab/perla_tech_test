import 'package:go_router/go_router.dart';
import 'package:perla_tech/features/presentation/pages/home_page.dart';
import 'package:perla_tech/features/presentation/pages/login_page.dart';
import 'package:perla_tech/features/presentation/pages/register_page.dart';
import 'package:perla_tech/features/presentation/pages/splash_page.dart';

class AppRouter{

  static String splash = '/';
  static String login = 'login';
  static String register = '/register';
  static String home = '/home';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(name: splash , path: splash ,builder: (context, state) => SplashPage(),),
      GoRoute(name: register ,
          path: register ,
          builder: (context, state) => RegisterPage(),
          routes: [GoRoute(name: login , path: login , builder: (context, state) => LoginPage(),) ]
      ),
      GoRoute( name: home,path: home , builder: (context, state) => HomePage(),),
    ],
  );

}