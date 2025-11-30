import 'package:english_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProfilePictureBottomSheet extends StatelessWidget {
  const ProfilePictureBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Thay đổi ảnh đại diện',
            style: theme.textTheme.titleLarge?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(
                Icons.photo_library,
                color: Colors.white,
              ),
            ),
            title: const Text('Chọn ảnh từ thư viện'),
            onTap: (){
              // TODO: Implement gallery picker
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
            ),
            title: const Text('Chụp ảnh'),
            onTap: (){
              // TODO: Implement camera capture
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: AppColors.primary,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            title: const Text(
              'Loại bỏ ảnh đại diện',
              style: TextStyle(
                color: AppColors.error,
              ),
            ),
            onTap: (){
              // TODO: Implement photo removal
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
