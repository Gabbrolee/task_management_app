import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/custom_button.dart';

import '../../../common/widget/app_style.dart';
import '../../../common/widget/height_spacer.dart';
import '../../../common/widget/reusable_text.dart';
import '../../auth/pages/login_screen.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstant.kHeight,
      width: AppConstant.kWidth,
      color: AppConstant.kBkDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTudcqIT-IVj5hvDg2t4Yw1SaYUEwsWMP-Glz0YVzYMbOICUm_TLrP26HTWeg&s"),
          ),
          const HeightSpacer(
            height: 50,
          ),
          CustomButton(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              height: AppConstant.kHeight * 0.06,
              width: AppConstant.kWidth * 0.9,
              color: AppConstant.kLight,
              text: "Login with a phone number")

        ],
      ),
    );
  }
}
