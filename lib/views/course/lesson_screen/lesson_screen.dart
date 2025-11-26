import 'package:chewie/chewie.dart';
import 'package:english_app/controllers/video_controller.dart';
import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/models/course.dart';
import 'package:english_app/services/dummy_data_service.dart';
import 'package:english_app/views/course/lesson_screen/widgets/certificate_dialog.dart';
import 'package:english_app/views/course/lesson_screen/widgets/resource_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LessonScreen extends StatefulWidget {
  final String lessonId;

  const LessonScreen({super.key, required this.lessonId});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late final LessonVideoController _videoController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _videoController = LessonVideoController(
      lessonId: widget.lessonId,
      onLoadingChanged: (bool loading) {
        setState(() => _isLoading = loading);
      },
      onCertificateEarned: (Course course) {
        if (mounted) {
          _showCertificateDialog(context, course);
        }
      },
    );
    _videoController.initializeVideo();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  void _showCertificateDialog(BuildContext context, Course course) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CertificateDialog(
          course: course,
          onDownload: () => _downloadCertificate(course),
        );
      },
    );
  }

  void _downloadCertificate(Course course) {
    // implement the actual certificate generation and download
    Get.snackbar(
      'Chứng chỉ đã sẵn sàng!',
      'Chứng chỉ của bạn cho khóa học ${course.title} đã sẵn sàng',
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final courseId = Get.parameters['courseId'];
    final course = courseId != null
        ? DummyDataService.getCourseById(courseId)
        : null;
    final isUnlocked = courseId != null
        ? DummyDataService.isCourseUnlocked(courseId)
        : false;

    if (course == null) {
      return Scaffold(body: Center(child: Text('Không tìm thấy khóa học')));
    }
    if (course.isPremium && !isUnlocked) {
      return Scaffold(
        body: Center(child: Text('Mua khóa học để mở khóa tất cả nội dung')),
      );
    }

    final lesson = course.lessons.firstWhere(
          (l) => l.id == widget.lessonId,
      orElse: () => course.lessons.first,
    );
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: _isLoading
                ? Container(
              color: theme.colorScheme.surface,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
                : _videoController.chewieController != null
                ? Chewie(controller: _videoController.chewieController!)
                : Container(
              color: theme.colorScheme.surface,
              child: const Center(
                child: Text('Lỗi tải video'),
              ),
            ),
          ),
          if(lesson != null)
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 16,
                          color: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${lesson.duration} phút',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Mô tả',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      lesson.description,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Tài liệu học tập',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...lesson.resources.map(
                          (resource) =>
                          ResourceTile(
                            title: resource.title,
                            icon: _getIconForResourceType(
                              resource.type,
                            ),
                            onTap: () {
                              // TODO: Implement resource download
                            },
                          ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  _getIconForResourceType(String type) {
    switch (type.toLowerCase()) {
      case 'pdf' :
        return Icons.picture_as_pdf;
      case 'zip' :
        return Icons.folder_zip;
      default:
        return Icons.insert_drive_file;
    }
  }
}
