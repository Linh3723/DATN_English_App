import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/views/help_and_support/widgets/contact_tile.dart';
import 'package:english_app/views/help_and_support/widgets/faq_tile.dart';
import 'package:english_app/views/help_and_support/widgets/help_search_bar.dart';
import 'package:english_app/views/help_and_support/widgets/help_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: Text(
          'Trợ Giúp & Hỗ Trợ',
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
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HelpSearchBar(),
              SizedBox(height: 24),
              HelpSection(
                title: 'Câu hỏi thường gặp',
                children: [
                  FaqTile(
                    question: 'Làm sao để lấy lại mật khẩu?',
                    answer: 'Vào màn hình đăng nhập, chọn “Quên mật khẩu”, nhập email đã đăng ký và làm theo hướng dẫn để đặt lại mật khẩu.',
                  ),
                  FaqTile(
                    question: 'Ứng dụng có miễn phí không?',
                    answer: 'Ứng dụng cung cấp cả khóa học miễn phí và khóa học trả phí.',
                  ),
                  FaqTile(
                    question: 'Làm sao để liên hệ bộ phận hỗ trợ?',
                    answer: 'Bạn có thể vào mục “Trợ Giúp & Hỗ Trợ” trong ứng dụng để gửi yêu cầu hoặc nhắn tin trực tiếp tới đội ngũ hỗ trợ.',
                  ),
                ],
              ),
              SizedBox(height: 24),
              HelpSection(
                title: 'Liên hệ chúng tôi',
                children: [
                  ContactTile(
                    title: 'Hỗ trợ qua Email',
                    subtitle: 'Nhận trợ giúp qua email',
                    icon: Icons.email_outlined,
                    onTap: () {},
                  ),
                  ContactTile(
                    title: 'Hỗ trợ qua tin nhắn',
                    subtitle: 'Nhắn tin trực tiếp với bộ phận hỗ trợ của chúng tôi',
                    icon: Icons.chat_outlined,
                    onTap: () {},
                  ),
                  ContactTile(
                    title: 'Hỗ trợ qua điện thoại',
                    subtitle: 'Liên hệ qua điện thoại và trò chuyện trực tiếp với bộ phận hỗ trợ của chúng tôi',
                    icon: Icons.phone_outlined,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
