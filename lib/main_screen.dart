import 'package:english_app/bloc/navigation/navigation_bloc.dart';
import 'package:english_app/bloc/navigation/navigation_event.dart';
import 'package:english_app/bloc/navigation/navigation_state.dart';
import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/views/course/course_list/course_list_screen.dart';
import 'package:english_app/views/home/home_screen.dart';
import 'package:english_app/views/profile/profile_screen.dart';
import 'package:english_app/views/quiz/quiz_list/quiz_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MainScreen extends StatelessWidget {
  final int? initialIndex;
  const MainScreen({
    super.key,
    this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc()..add(
        NavigationToTab(initialIndex ?? 0)
      ),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state){
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            body: IndexedStack(
              index: state.currentIndex,
              children: [
                HomeScreen(),
                CourseListScreen(),
                QuizListScreen(),
                ProfileScreen(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              backgroundColor: AppColors.accent,
              indicatorColor: AppColors.primary.withOpacity(0.1),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Trang chủ',
                ),
                NavigationDestination(
                  icon: Icon(Icons.play_lesson_outlined),
                  selectedIcon: Icon(Icons.play_lesson),
                  label: 'Khóa học',
                ),
                NavigationDestination(
                  icon: Icon(Icons.quiz_outlined),
                  selectedIcon: Icon(Icons.quiz),
                  label: 'Bài tập',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Hồ sơ',
                ),
              ],
              selectedIndex: state.currentIndex,
              onDestinationSelected: (index){
                context.read<NavigationBloc>().add(NavigationToTab(index));
              },
            ),
          );
        }),
    );
  }
}
