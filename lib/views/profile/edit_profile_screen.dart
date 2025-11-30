import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/views/profile/widgets/edit_profile_app_bar.dart';
import 'package:english_app/views/profile/widgets/profile_picture_bottom_sheet.dart';
import 'package:english_app/views/widgets/common/custom_button.dart';
import 'package:english_app/views/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditProfileAppBar(
        onSave: (){
          // save profile changes
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // profile picture section with gradient background
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primaryLight,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.accent,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.accent,
                          child: Text(
                            'NV',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.accent,
                            radius: 20,
                            child: IconButton(
                              onPressed: (){
                                showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  builder: (context) => ProfilePictureBottomSheet(),
                                );
                              },
                              color: AppColors.primary,
                              icon: const Icon(
                                Icons.mode_edit_outline,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Chỉnh sửa hồ sơ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Form fields
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section title
                  Padding(
                    padding: EdgeInsets.only(bottom: 16, left: 4),
                    child: Text(
                      'Thông tin cá nhân',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Form fields in card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: const Column(
                      children: [
                        CustomTextfield(
                          label: 'Họ và tên',
                          prefixIcon: Icons.person_outline,
                          initialValue: 'Nguyễn Văn A',
                        ),
                        SizedBox(height: 16),
                        CustomTextfield(
                          label: 'Email',
                          prefixIcon: Icons.email_outlined,
                          initialValue: 'abc@gmail.com',
                        ),
                        SizedBox(height: 16),
                        CustomTextfield(
                          label: 'Số điện thoại',
                          prefixIcon: Icons.phone_outlined,
                          initialValue: '0912-345-678',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // save button
                  CustomButton(
                    text: 'Lưu',
                    onPressed: (){
                      // save profile changes
                      Get.back();
                    },
                    icon: Icons.check_circle_outline,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
