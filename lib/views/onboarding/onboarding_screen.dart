import 'package:english_app/core/theme/app_colors.dart';
import 'package:english_app/routes/app_routes.dart';
import 'package:english_app/services/storage_service.dart';
import 'package:english_app/views/onboarding/widgets/onboarding_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:english_app/models/onboarding_item.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget{
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _pages = [
    OnboardingItem(
      image: 'assets/images/onboarding/onboarding_1.png',
      title: 'Học thông minh – nói tự tin',
      description: 'Khám phá cách học tiếng Anh cá nhân hoá. Ứng dụng phân tích giọng nói, sửa lỗi phát âm và giúp bạn luyện nói tự nhiên như người bản xứ.',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding/onboarding_2.png',
      title: 'Học mọi lúc mọi nơi',
      description: 'Dù bạn đang trên đường, ở nhà hay trong quán cà phê, chỉ cần mở app, chọn bài học và bắt đầu học.',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding/onboarding_3.png',
      title: 'Theo dõi tiến độ của bạn',
      description: 'Xem điểm phát âm, vốn từ và thành tích mỗi ngày. Biểu đồ tiến bộ giúp bạn thấy rõ hành trình chinh phục tiếng Anh của chính mình.',
    ),
  ];

  void _completeOnboarding()async{
    await StorageService.setFirstTime(false);
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children:[
          // Page view
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index){
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index){
              return OnboardingPageWidget(
                page: _pages[index],
              );
            },
          ),

          // skip button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: _completeOnboarding,
              child: const Text(
                'Bỏ qua',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // bottom navigation
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // page indicator
                SmoothPageIndicator(
                  controller: _pageController,
                  count: _pages.length,
                  effect: const WormEffect(
                    dotColor: Colors.white,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 8,
                  ),
                ),
                
                // next/get started button
                ElevatedButton(
                  onPressed: (){
                    if(_currentPage == _pages.length - 1){
                      _completeOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    _currentPage == _pages.length -1 ? 'Bắt đầu' : 'Tiếp theo',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}