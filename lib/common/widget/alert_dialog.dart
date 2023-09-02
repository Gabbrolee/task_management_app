import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';

showAlertDialog(
    {required BuildContext context, required String message, String? btnText}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: ReusableText(
            text: message,
            style: appStyle(18, AppConstant.kLight, FontWeight.w600),
          ),
          contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(btnText ?? "OK",
                  style: appStyle(18, AppConstant.kLight, FontWeight.w600),
                ))
          ],
        );
      });
}
