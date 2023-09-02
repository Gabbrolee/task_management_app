import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';

import '../../../common/widget/alert_dialog.dart';
import '../providers/auth_provider.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({Key? key, required this.smsCodeId, required this.phone})
      : super(key: key);
  final String smsCodeId;
  final String phone;

  void verifyOtpCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifyOtpCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(height: AppConstant.kHeight * 0.15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTudcqIT-IVj5hvDg2t4Yw1SaYUEwsWMP-Glz0YVzYMbOICUm_TLrP26HTWeg&s",
                  width: AppConstant.kWidth * 0.5,
                ),
              ),
              const HeightSpacer(height: 26),
              ReusableText(
                  text: "Enter your otp code",
                  style: appStyle(18, AppConstant.kLight, FontWeight.bold)),
              Pinput(
                length: 6,
                showCursor: true,
                onCompleted: (value) {
                  if (value.length == 6) {
                    return verifyOtpCode(context, ref, value);
                  } else {
                    showAlertDialog(
                        context: context, message: "you enter wrong code");
                  }
                },
                onSubmitted: (value) {
                  if (value.length == 6) {
                    return verifyOtpCode(context, ref, value);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
