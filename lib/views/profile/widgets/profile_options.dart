import 'package:english_app/core/utils/app_dialogs.dart';
import 'package:english_app/routes/app_routes.dart';
import 'package:english_app/views/profile/widgets/profile_options_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionsCard(
          title: 'Chỉnh sửa',
          subtitle: 'Chỉnh sửa thông tin cá nhân của bạn',
          icon: Icons.edit_outlined,
          onTap: () => Get.toNamed(AppRoutes.editProfile),
        ),
        ProfileOptionsCard(
          title: 'Nhắc nhở',
          subtitle: 'Quản lý nhắc nhở của bạn',
          icon: Icons.notifications_outlined,
          onTap: () => Get.toNamed(AppRoutes.notifications),
        ),
        ProfileOptionsCard(
          title: 'Cài đặt',
          subtitle: 'Cài đặt ứng dụng theo ý muốn của bạn',
          icon: Icons.settings_outlined,
          onTap: () => Get.toNamed(AppRoutes.settings),
        ),
        ProfileOptionsCard(
          title: 'Trợ giúp',
          subtitle: 'Nhận trợ giúp hoặc liên hệ bộ phận hỗ trợ',
          icon: Icons.edit_outlined,
          onTap: () {},
        ),
        ProfileOptionsCard(
          title: 'Đăng xuất',
          subtitle: 'Thoát khỏi tài khoản của khoản',
          icon: Icons.edit_outlined,
          onTap: () async{
            final confirm = await AppDialogs.showLogoutDialog();
            if(confirm == true){
              // navigate to login page
              Get.offAllNamed(AppRoutes.login);
            }
          },
          isDestructive: true,
        ),
      ],
    );
  }
}
