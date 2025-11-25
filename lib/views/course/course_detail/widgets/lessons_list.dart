import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/services/dummy_data_service.dart';
import 'package:english_app/views/course/course_detail/widgets/lesson_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LessonsList extends StatelessWidget {
  final String courseId;
  final bool isUnlocked;
  final VoidCallback? onLessonComplete;

  const LessonsList({
    super.key,
    required this.courseId,
    required this.isUnlocked,
    this.onLessonComplete,
  });

  @override
  Widget build(BuildContext context) {
    final course = DummyDataService.getCourseById(courseId);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: course.lessons.length,
      itemBuilder: (context, index) {
        final lesson = course.lessons[index];
        final isLocked =
            !lesson.isPreview &&
            (index > 0 &&
                !DummyDataService.isLessonCompleted(
                  course.id,
                  course.lessons[index - 1].id,
                ));
        return LessonTitle(
          title: lesson.title,
          duration: '${lesson.duration} phút',
          isCompleted: DummyDataService.isLessonCompleted(course.id, lesson.id),
          isLocked: isLocked,
          isUnlocked: isUnlocked,
          onTap: () async{
            if(course.isPremium && !isUnlocked){
              Get.snackbar(
                'Khóa học có phí',
                'Trả phí để mở khóa toàn bộ khóa học',
                backgroundColor: AppColors.primary,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            } else if (isLocked){
              Get.snackbar(
                'Bài học này đang bị khóa',
                'Hãy hoàn thành bài học trước đó để mở khóa',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                duration: const Duration(seconds: 3),
              );
            } else {
              // navigate to leson screen
            }
          },
        );
      },
    );
  }
}
