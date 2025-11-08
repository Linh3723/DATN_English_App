import 'package:english_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{

  // auth routes
  static const String splash = '/splash';

  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case splash:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text('Route not found!'),
              ),
            ),
        );
    }
  }
}