import 'package:english_app/models/course.dart';
import 'package:english_app/routes/app_routes.dart';
import 'package:english_app/services/dummy_data_service.dart';
import 'package:english_app/views/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ActionButtons extends StatelessWidget {
  final Course course;

  const ActionButtons({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              if (course.isPremium &&
                  !DummyDataService.isCourseUnlocked(course.id)) {
                // navigate to payment screen if the course is premium and not purchased
                Get.toNamed(
                  AppRoutes.payment,
                  arguments: {
                    'courseId': course.id,
                    'courseName': course.title,
                    'price': course.price,
                  },
                );
              } else {
                // navigate to first lesson if course is free or already purchased
                Get.toNamed(
                  AppRoutes.lesson.replaceAll(':id', course.lessons.first.id),
                  parameters: {'courseId': course.id},
                );
              }
            },
            label: const Text('Bắt đầu học'),
            icon: const Icon(Icons.play_circle),
          ),
        ),
        // only show chat button if course is not premium or if it's unlocked
        if (!course.isPremium ||
            DummyDataService.isCourseUnlocked(course.id)) ...[
          const SizedBox(width: 16),
          IconButton(
            onPressed: () => Get.to(
              () => ChatScreen(
                courseId: course.id,
                instructorId: course.instructorId,
                isTeacherView: false,
              ),
            ),
            icon: const Icon(Icons.chat),
          ),
        ],
      ],
    );
  }
}
