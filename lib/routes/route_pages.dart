import 'package:english_app/routes/app_routes.dart';
import 'package:english_app/views/auth/login_screen.dart';
import 'package:english_app/views/home/home_screen.dart';
import 'package:english_app/views/onboarding/onboarding_screen.dart';
import 'package:english_app/views/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppPages{
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const HomeScreen(),
    ),
  ];
}