import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/services/dummy_data_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverViewCardsWidget extends StatelessWidget {
  final String instructorId;

  const OverViewCardsWidget({super.key, required this.instructorId});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    final stats = DummyDataService.getTeacherStats(instructorId);
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildStatCard(
          'Tổng số học sinh',
          '${stats.totalStudents}',
          Icons.people,
        ),
        _buildStatCard(
          'Khóa học đang hoạt động',
          '${stats.activeCourses}',
          Icons.school,
        ),
        _buildStatCard(
          'Tổng doanh thu',
          '${formatter.format(stats.totalRevenue)} VNĐ',
          Icons.attach_money,
        ),
        _buildStatCard(
          'Đánh giá trung bình',
          stats.averageRating.toString(),
          Icons.star,
        ),
      ],
    );
  }
  Widget _buildStatCard(
      String title,
      String value,
      IconData icon,
      ){
    return LayoutBuilder(builder: (context, constraints){
      // calculate font sizes based on available space
      final maxWidth = constraints.maxWidth;
      final maxHeight = constraints.maxHeight;

      final valueFontSize = maxWidth * 0.15;
      final titleFontSize = maxWidth * 0.08;
      final iconSize = maxHeight * 0.25;
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: iconSize,
            ),
            const SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: valueFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 4),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: titleFontSize,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
