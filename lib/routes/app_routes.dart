import 'package:english_app/main_screen.dart';
import 'package:english_app/views/auth/forgot_password_screen.dart';
import 'package:english_app/views/auth/login_screen.dart';
import 'package:english_app/views/auth/register_screen.dart';
import 'package:english_app/views/chat/chat_list_screen.dart';
import 'package:english_app/views/course/course_detail/course_detail_screen.dart';
import 'package:english_app/views/course/course_list/course_list_screen.dart';
import 'package:english_app/views/course/lesson_screen/lesson_screen.dart';
import 'package:english_app/views/course/payment/payment_screen.dart';
import 'package:english_app/views/home/home_screen.dart';
import 'package:english_app/views/notifications/notification_screen.dart';
import 'package:english_app/views/onboarding/onboarding_screen.dart';
import 'package:english_app/views/profile/profile_screen.dart';
import 'package:english_app/views/quiz/quiz_attempt/quiz_attempt_screen.dart';
import 'package:english_app/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:english_app/views/splash/splash_screen.dart';
import 'package:english_app/views/teacher/my_courses/my_courses_screen.dart';
import 'package:english_app/views/teacher/teacher_home_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  // main
  static const String main = '/main';

  // auth routes
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String home = '/home';


  // course routes
  static const String courseList = '/courses';
  static const String courseDetail = '/course/:id';
  static const String payment = '/payment';
  static const String lesson = '/lesson/:id';

  // quiz routes
  static const String quizList = '/quizzes';
  static const String quizAttempt = '/quiz/:id';
  static const String quizResult = '/quiz/result';


  // profile routes
  static const String profile = '/profile';
  static const String notifications = '/notifications';


  // teacher
  static const String teacherHome = '/teacher/home';
  static const String myCourses = '/teacher/courses';
  static const String teacherChats = '/teacher/chats';


  static Route<dynamic> onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case splash:
        return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
        );
        
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );

      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case register:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );

      case main:
        return MaterialPageRoute(
          builder: (_) => MainScreen(
            initialIndex: setting.arguments is Map
                ? (setting.arguments as Map<String, dynamic>)['initialIndex'] as int?
                : null,
          ),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case teacherHome:
        return MaterialPageRoute(
          builder: (_) => const TeacherHomeScreen(),
        );

      case teacherChats:
        return MaterialPageRoute(
          builder: (_) => const ChatListScreen(),
        );

      case myCourses:
        return MaterialPageRoute(
          builder: (_) => const MyCoursesScreen(),
        );

      case courseList:
        final args = setting.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => CourseListScreen(
            categoryId: args?['category'] as String?,
            categoryName: args?['categoryName'] as String?,
          ),
        );

      case courseDetail:
        String courseId;
        if(setting.arguments != null){
          courseId = setting.arguments as String;
        }else {
          final uri = Uri.parse(setting.name ?? '');
          courseId = uri.pathSegments.last;
        }
        return MaterialPageRoute(builder: (_) => CourseDetailScreen(courseId: courseId));
            
      case quizList:
        return MaterialPageRoute(
          builder: (_) => const QuizListScreen(),
        );

      case quizAttempt:
        final quizId = setting.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => QuizAttemptScreen(
            quizId: quizId ?? '',
          ),
        );

      case lesson:
        final lessonId = setting.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => LessonScreen(
            lessonId: lessonId ?? '',
          ),
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );

      case notifications:
        return MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        );

      case payment:
        final args = setting.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PaymentScreen(
            courseId: args['courseId'] ?? '',
            courseName: args['courseName'] ?? '',
            price: args['price'] ?? 0.0,
          ),
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