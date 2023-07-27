import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/custom_button.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';
import '../../../common/widget/custom_textfield.dart';
import 'otp_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phone = TextEditingController();

  Country country = Country(
      phoneCode: "+1",
      countryCode: "US",
      e164Sc: 0,
      geographic: true,
      name: "USA",
      example: "USA",
      displayName: "United States",
      displayNameNoCountryCode: "US",
      e164Key: "",
      level: 0);
  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTudcqIT-IVj5hvDg2t4Yw1SaYUEwsWMP-Glz0YVzYMbOICUm_TLrP26HTWeg&s"),
              ),
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
                                  backgroundColor: AppConstant.kLight,
                                  bottomSheetHeight: AppConstant.kHeight * 0.6,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(AppConstant.kRadius),
                                  )),
                              onSelect: (code) {
                                setState(() {});
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OtpScreen()));
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
