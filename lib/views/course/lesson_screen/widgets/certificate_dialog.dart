import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/models/course.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CertificateDialog extends StatelessWidget {
  final Course course;
  final VoidCallback onDownload;

  const CertificateDialog({
    super.key,
    required this.course,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Xin chúc mừng!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.workspace_premium,
            size: 64,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'Bạn đã hoàn thành toàn bộ bài học trong khóa học "${course.title}"',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Bây giờ bạn có thể tải xuống chứng chỉ của mình',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  'Để sau',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  onDownload();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 12,
                  ),
                  backgroundColor: AppColors.primary,
                ),
                child: Text(
                  'Để sau',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
