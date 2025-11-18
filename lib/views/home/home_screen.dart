import 'package:english_app/models/category.dart';
import 'package:english_app/services/dummy_data_service.dart';
import 'package:english_app/views/home/widgets/category_section.dart';
import 'package:english_app/views/home/widgets/home_app_bar.dart';
import 'package:english_app/views/home/widgets/in_progress_section.dart';
import 'package:english_app/views/home/widgets/recommended_section.dart';
import 'package:english_app/views/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Category> categories = [
    Category(
      id: '1',
      name: 'Nghe',
      icon: Icons.headphones,
      courseCount: DummyDataService.getCourseByCategory('1').length,
    ),
    Category(
      id: '2',
      name: 'Nói',
      icon: Icons.mic,
      courseCount: DummyDataService.getCourseByCategory('2').length,
    ),
    Category(
      id: '3',
      name: 'Đọc',
      icon: Icons.menu_book,
      courseCount: DummyDataService.getCourseByCategory('3').length,
    ),
    Category(
      id: '4',
      name: 'Viết',
      icon: Icons.edit,
      courseCount: DummyDataService.getCourseByCategory('4').length,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        HomeAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SearchBarWidget(),
                const SizedBox(height: 32),
                CategorySection(
                  categories: categories,
                ),
                const SizedBox(height: 32),
                const InProgressSection(),
                const RecommendedSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}