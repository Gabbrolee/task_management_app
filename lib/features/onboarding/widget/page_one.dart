import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';

import '../../../common/widget/height_spacer.dart';
import '../../../common/widget/reusable_text.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: 'Todo with Riverpod',
                style: appStyle(30, AppConstant.kLight, FontWeight.w600),
              ),
              const HeightSpacer(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  "Welcome!! do you want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appStyle(16, AppConstant.kGreyLight, FontWeight.normal),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
