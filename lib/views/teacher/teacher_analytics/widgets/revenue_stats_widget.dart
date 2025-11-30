import 'package:english_app/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RevenueStatsWidget extends StatelessWidget {
  const RevenueStatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###', 'vi_VN');
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thống kê doanh thu (ĐV: triệu)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRevenueMetric('Doanh thu theo tháng', '${formatter.format(9000)} VNĐ'),
              _buildRevenueMetric('Doanh thu theo năm', '${formatter.format(87000)} VNĐ'),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Doanh thu theo khóa học',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 5000,
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 3000)]),
                  BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 2000)]),
                  BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 4000)]),
                  BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 1500)]),
                ],
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta){
                        const titles = [
                          'Course 1',
                          'Course 2',
                          'Course 3',
                          'Course 4',
                        ];
                        return Text(
                          titles[value.toInt()],
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        );
                      }
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueMetric(
      String title,
      String value,
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
