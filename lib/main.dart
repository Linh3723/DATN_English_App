import 'package:english_app/bloc/font/font_bloc.dart';
import 'package:english_app/bloc/font/font_state.dart';
import 'package:english_app/core/theme/app_theme.dart';
import 'package:english_app/routes/app_routes.dart';
import 'package:english_app/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FontBloc>(
              create: (context) => FontBloc(),
          ),
        ],
        child: BlocBuilder<FontBloc, FontState>(
            builder: (context, fontState){
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'English Learning App',
                theme: AppTheme.getLightTheme(fontState),
                themeMode: ThemeMode.light,
                initialRoute: AppRoutes.splash,
                onGenerateRoute: AppRoutes.onGenerateRoute,
                getPages: AppPages.pages,
              );
            })
    );
        
  }
}
