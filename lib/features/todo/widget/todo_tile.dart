import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/width_spacer.dart';

import '../../../common/widget/reusable_text.dart';

class TodoTile extends StatelessWidget {
  const TodoTile(
      {Key? key,
      this.color,
      this.title,
      this.description,
      this.start,
      this.end,
      this.editWidget,
      this.delete, this.switcher})
      : super(key: key);

  final Color? color;
  final String? title;
  final String? description;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConstant.kWidth,
            decoration: BoxDecoration(
                color: AppConstant.kGreyLight,
                borderRadius:
                    BorderRadius.all(Radius.circular(AppConstant.kRadius))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(AppConstant.kRadius)),

                          ///TODO: Add dynamic color
                          color: color ?? AppConstant.kRed),
                    ),
                    const WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConstant.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? 'Title Of Todo',
                              style: appStyle(
                                  18, AppConstant.kLight, FontWeight.bold),
                            ),
                            const HeightSpacer(height: 3),
                            ReusableText(
                              text: description ?? 'description of Todo',
                              style: appStyle(
                                  12, AppConstant.kLight, FontWeight.bold),
                            ),
                            const HeightSpacer(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConstant.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                      color: AppConstant.kBkDark,
                                      border: Border.all(
                                          width: 0.3,
                                          color: AppConstant.kGreyDk),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              AppConstant.kRadius))),
                                  child: Center(
                                      child: ReusableText(
                                    text: "$start | $end",
                                    style: appStyle(12, AppConstant.kLight,
                                        FontWeight.normal),
                                  )),
                                ),
                                WidthSpacer(width: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                      child: editWidget,
                                    ),
                                    const WidthSpacer(width: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: const Icon(
                                          MaterialCommunityIcons.delete_circle),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 0.h),
                  child: switcher,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
