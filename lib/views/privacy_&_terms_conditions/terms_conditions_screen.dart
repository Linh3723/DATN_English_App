import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/views/privacy_&_terms_conditions/widgets/legal_document_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
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
            const LegalDocumentSection(
              title: '1. Chấp nhận Điều khoản',
              content: 'Bằng việc sử dụng ứng dụng/dịch vụ của chúng tôi, bạn đồng ý tuân thủ các điều khoản và điều kiện được nêu trong tài liệu này. Nếu bạn không đồng ý với bất kỳ điều khoản nào, vui lòng ngừng sử dụng dịch vụ ngay lập tức.',
            ),
            const LegalDocumentSection(
              title: '2. Trách nhiệm của Người dùng',
              content: 'Người dùng cam kết sử dụng ứng dụng/dịch vụ một cách hợp pháp và không thực hiện bất kỳ hành vi nào gây hại, phá hoại hoặc xâm phạm quyền lợi của người khác. Bạn chịu trách nhiệm bảo mật thông tin đăng nhập và mọi hoạt động xảy ra dưới tài khoản của mình.',
            ),
            const LegalDocumentSection(
              title: '3. Sở hữu Trí tuệ',
              content: 'Tất cả nội dung, bản quyền, nhãn hiệu và tài sản trí tuệ khác trong ứng dụng đều thuộc quyền sở hữu của chúng tôi hoặc các bên cấp phép. Việc sao chép, phân phối hoặc sử dụng trái phép các nội dung này đều bị nghiêm cấm.',
            ),
            const LegalDocumentSection(
              title: '4. Giới hạn Trách nhiệm',
              content: 'Chúng tôi không chịu trách nhiệm đối với bất kỳ tổn thất hay thiệt hại trực tiếp, gián tiếp phát sinh từ việc sử dụng ứng dụng hoặc dữ liệu cung cấp bởi dịch vụ. Người dùng sử dụng dịch vụ hoàn toàn chịu rủi ro của mình.',
            ),
          ],
        ),
      ),
    );
  }
}
