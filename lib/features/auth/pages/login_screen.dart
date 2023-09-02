import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/custom_button.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';
import 'package:task_management_app/features/auth/providers/auth_provider.dart';
import 'package:task_management_app/features/auth/providers/code_provider.dart';
import 'package:task_management_app/common/widget/alert_dialog.dart';
import'package:task_management_app/common/widget/custom_textfield.dart';
import '../../../common/constant/image_path.dart';
import 'otp_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phone = TextEditingController();

  Country country = Country(
      phoneCode: "86",
      countryCode: "CN",
      e164Sc: 0,
      geographic: true,
      name: "China",
      example: "China",
      displayName: "China",
      displayNameNoCountryCode: "CN",
      e164Key: "",
      level: 1);

  sendCodeToUser() {
    if (phone.text.isEmpty) {
      return showAlertDialog(
          context: context, message: 'Please enter your phone number');
    } else if (phone.text.length < 8) {
      return showAlertDialog(
          context: context, message: 'Your number is too short');
    } else {
      print("+${country.phoneCode}${phone.text}");
      ref.read(authControllerProvider).sendSms(
          context: context,
          phone: "+${country.phoneCode}${phone.text}");

    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(codeStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14.0,
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(ImagePath.todo)),
              const HeightSpacer(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 16.w),
                child: ReusableText(
                  text: "Please enter your phone number",
                  style: appStyle(17, AppConstant.kLight, FontWeight.w500),
                ),
              ),
              const HeightSpacer(height: 20),
              Center(
                child: CustomTextField(
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                        onTap: () {
                          showCountryPicker(
                              context: context,
                              countryListTheme: CountryListThemeData(
                                  backgroundColor: AppConstant.kGreyLight,
                                  bottomSheetHeight: AppConstant.kHeight * 0.6,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(AppConstant.kRadius),
                                  )),
                              onSelect: (code) {
                                setState(() {
                                  country = code;
                                });
                                ref
                                    .read(codeStateProvider.notifier)
                                    .setStart(country.phoneCode);
                              });
                        },
                        child: ReusableText(
                          text: "${country.flagEmoji} ${country.phoneCode}",
                          style: appStyle(
                              18, AppConstant.kBkDark, FontWeight.w600),
                        )),
                  ),
                  hintText: 'Enter phone number',
                  hintStyle: appStyle(16, AppConstant.kBkDark, FontWeight.w600),
                  controller: phone,
                  keyboardType: TextInputType.phone,
                ),
              ),
              const HeightSpacer(height: 20),
              CustomButton(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const OtpScreen(
                  //               smsCodeId: '',
                  //               phone: '',
                  //             )));
                  sendCodeToUser();
                },
                height: AppConstant.kHeight * 0.08,
                width: AppConstant.kWidth * 0.9,
                color: AppConstant.kBkDark,
                buttonColor: AppConstant.kLight,
                text: "Send Code",
              )
            ],
          ),
        ),
      ),
    );
  }
}
