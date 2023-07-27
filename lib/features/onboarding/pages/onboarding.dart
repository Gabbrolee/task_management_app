import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';
import 'package:task_management_app/common/widget/width_spacer.dart';
import '../widget/page_one.dart';
import '../widget/page_two.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: const [PageOne(), PageTwo()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeIn);
                        },
                        child: const Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppConstant.kLight,
                        ),
                      ),
                      const WidthSpacer(width: 5),
                      ReusableText(
                          text: "Skip",
                          style:
                              appStyle(16, AppConstant.kLight, FontWeight.w500))
                    ],
                  ),
                  GestureDetector(
                    onTap: null,
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: const WormEffect(
                          dotHeight: 12,
                          dotWidth: 16,
                          spacing: 10,
                          dotColor: AppConstant.kYellow),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
