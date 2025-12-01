import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/views/privacy_&_terms_conditions/widgets/legal_document_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cập nhật lần cuối: 01/12/2025',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.secondary,
              ),
            ),
            const SizedBox(height: 24),
            LegalDocumentSection(
              title: '1. Thu thập thông tin',
              content: 'Ứng dụng có thể thu thập một số dữ liệu nhất định nhằm đảm bảo hoạt động ổn định và cá nhân hóa trải nghiệm người dùng. Các dữ liệu này có thể bao gồm: thông tin tài khoản (tên, email, ảnh đại diện), dữ liệu sử dụng ứng dụng, thông tin thiết bị và nhật ký hoạt động.',
            ),
            LegalDocumentSection(
              title: '2. Mục đích sử dụng thông tin',
              content: 'Thông tin được thu thập được sử dụng nhằm cung cấp và duy trì các tính năng của ứng dụng, đồng thời nâng cao trải nghiệm học tập của người dùng. Dữ liệu này cũng giúp cải thiện hiệu suất của hệ thống thông qua việc phân tích hành vi sử dụng và hỗ trợ đội ngũ vận hành trong việc giải quyết các vấn đề kỹ thuật hoặc yêu cầu hỗ trợ.',
            ),
            LegalDocumentSection(
              title: '3. Bảo mật và lưu trữ dữ liệu',
              content: 'Chúng tôi áp dụng các biện pháp bảo mật phù hợp để bảo vệ dữ liệu cá nhân khỏi truy cập trái phép, thay đổi hoặc tiết lộ không mong muốn. Mọi dữ liệu được lưu trữ một cách an toàn và chỉ được sử dụng theo mục đích đã nêu. Chúng tôi cam kết không bán, trao đổi hay chia sẻ thông tin cá nhân với bên thứ ba khi chưa có sự đồng ý của bạn.',
            ),
            LegalDocumentSection(
              title: '4. Quyền và lựa chọn của người dùng',
              content: 'Bạn có quyền truy cập, chỉnh sửa hoặc yêu cầu xóa dữ liệu cá nhân bất cứ lúc nào. Bạn cũng có thể từ chối chia sẻ một số loại dữ liệu không bắt buộc. Nếu có bất kỳ câu hỏi hoặc yêu cầu nào liên quan đến quyền riêng tư, bạn có thể liên hệ với chúng tôi qua mục hỗ trợ của ứng dụng.',
            ),
          ],
        ),
      ),
    );
  }
}
