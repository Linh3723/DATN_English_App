import 'package:english_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback onSave;

  const EditProfileAppBar({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Chỉnh sửa hồ sơ cá nhân',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.primary,
      leading: IconButton(
        onPressed: () => Get.back(), 
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        TextButton(
          onPressed: onSave,
          child: Text(
            'Lưu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


