import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<>(builder: (context, state){
      return SliverAppBar(
        expandedHeight: 100,
        floating: false,
        pinned: true,
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.analytics),
            icon: Icon(Icons.analytics),
            color: Colors.white,
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chào mừng quay lại',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: AppColors.accent.withOpacity(0.7),
                ),
              ),
              Text(
                'ABC',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          background: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primaryLight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      );
    });
  }
}
