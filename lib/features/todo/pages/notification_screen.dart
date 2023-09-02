import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/width_spacer.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';

import '../../../common/constant/image_path.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key, this.payload}) : super(key: key);

  final String? payload;

  @override
  Widget build(BuildContext context) {
    var title = payload!.split('|')[0];
    var description = payload!.split('|')[1];
    var date = payload!.split('|')[2];
    var startTime = payload!.split('|')[3];
    var endTime = payload!.split('|')[4];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(
                width: AppConstant.kWidth,
                height: AppConstant.kHeight * 0.7,
                decoration: const BoxDecoration(
                  color: AppConstant.kBkLight,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: "Reminder",
                        style:
                            appStyle(40, AppConstant.kLight, FontWeight.bold),
                      ),
                      const HeightSpacer(height: 3),
                      Container(
                        width: AppConstant.kWidth,
                        padding: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: AppConstant.kYellow,
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.h))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: "Today",
                              style: appStyle(
                                  14, AppConstant.kBkDark, FontWeight.bold),
                            ),
                            const WidthSpacer(width: 15),
                            ReusableText(
                              text: "From : $startTime To : $endTime",
                              style: appStyle(
                                  15, AppConstant.kBkDark, FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const HeightSpacer(
                        height: 10,
                      ),
                      ReusableText(
                          text: title,
                          style: appStyle(
                              30, AppConstant.kLight, FontWeight.w500)),
                      const HeightSpacer(
                        height: 10,
                      ),
                      Text(description,
                          maxLines: 8,
                          textAlign: TextAlign.justify,
                          style: appStyle(
                              16, AppConstant.kLight, FontWeight.w300))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 12.w,
              top: -10,
              child: Image.asset(
                // 'assets/bell.png',
                ImagePath.bell,
                width: 70.w,
                height: 70.h,
                color: AppConstant.kBkDark,
                colorBlendMode: BlendMode.difference,
              ),
            ),
            Positioned(
                bottom: -AppConstant.kHeight * 0.14 ,
                left: 0,
                right: 0,
              child: Image.asset(
                // 'assets/notification.jpeg',
                ImagePath.notification,
                width: double.infinity,
                height: AppConstant.kHeight * 0.6,
                color: AppConstant.kBkLight,
                colorBlendMode: BlendMode.difference,
              ),
            )
          ],
        ),
      ),
    );
  }
}
