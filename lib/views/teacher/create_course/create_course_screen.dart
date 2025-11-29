import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/views/teacher/create_course/widgets/create_course_app_bar.dart';
import 'package:english_app/views/widgets/common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({super.key});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedLevel = 'Beginner';
  bool _isPremium = false;
  final List<String> _requirements = [''];
  final List<String> _learningPoint = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CreateCourseAppBar(
            onSubmit: _submitForm,
          ),
          SliverToBoxAdapter(
            child: Form(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    _buildImagePicker(),
                    const SizedBox(height: 32),
                    CustomTextfield(
                      label: 'Tiêu đề',
                      hint: 'Nhập tiêu đề của khóa học',
                      maxLines: 1,
                      validator: (value) {
                        if(value?.isEmpty ?? true){
                          return 'Hãy nhập tiêu đề khóa học';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextfield(
                      label: 'Mô tả',
                      hint: 'Nhập mô tả về khóa học',
                      maxLines: 3,
                      validator: (value) {
                        if(value?.isEmpty ?? true){
                          return 'Hãy nhập mô tả về khóa học';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                            label: 'Giá',
                            hint: 'Nhập giá của khóa học',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if(value?.isEmpty ?? true){
                                return 'Bắt buộc';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildDropdown(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _buildPremiumSwitch(),
                    const SizedBox(height: 32),
                    _buildDynamicList(
                      'Kỹ năng cần thiết',
                      _requirements,
                        (index) => _requirements.removeAt(index),
                        () => _requirements.add(''),
                    ),
                    const SizedBox(height: 32),
                    _buildDynamicList(
                      'Những gì bạn sẽ học được',
                      _learningPoint,
                          (index) => _requirements.removeAt(index),
                          () => _requirements.add(''),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDynamicList(
      String title,
      List<String> items,
      Function(int) onRemove,
      Function() onAdd,
      ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        inputDecorationTheme: InputDecorationTheme(
                          hintStyle: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      child: CustomTextfield(
                        label: '',
                        hint: 'Nhập $title',
                        initialValue: items[index],
                        onChanged: (value) => items[index] = value,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if(items.length > 1){
                          onRemove(index);
                        }
                      });
                    },
                    icon: Icon(
                      Icons.circle_outlined,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TextButton.icon(
          onPressed: () {
            setState(() {
              onAdd();
            });
          },
          icon: const Icon(
            Icons.add,
          ),
          label: Text(
            'Thêm $title',
          ),
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildPremiumSwitch(){
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Khóa học Premium',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: _isPremium,
            onChanged: (value) {
              setState(() {
                _isPremium = value;
              });
            },
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cấp độ',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedLevel,
              items: ['Beginner', 'Intermediate', 'Advanced'].map(
                  (level) => DropdownMenuItem(
                      child: Text(level), value: level,
                  )).toList(),
              onChanged: (value){
                setState(() {
                  _selectedLevel = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
  void _submitForm(){
    if(_formKey.currentState?.validate() ?? false){
      // implement course creation logic
      Get.back();
    }
  }
  Widget _buildImagePicker(){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_photo_alternate,
            size: 48,
          ),
        ),
      ),
    );
  }
}
