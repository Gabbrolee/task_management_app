import 'package:flutter/material.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.keyboardType,
      required this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      required this.controller, this.onChanged})
      : super(key: key);

  final TextInputType? keyboardType;
  final String hintText;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? hintStyle;
  final TextEditingController controller;
  final  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstant.kWidth * 0.9,
      decoration: BoxDecoration(
          color: AppConstant.kLight,
          borderRadius: BorderRadius.circular(AppConstant.kRadius)),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        cursorHeight: 25,
        onChanged: onChanged,
        style: appStyle(18, AppConstant.kBkDark, FontWeight.w700),
        decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixIconColor: AppConstant.kBkDark,
            hintStyle: hintStyle,
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConstant.kRed, width: 0.5)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConstant.kRed, width: 0.5)),
            disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: AppConstant.kGreyDk, width: 0.5)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:
                    BorderSide(color: AppConstant.kBkDark, width: 0.5))),
      ),
    );
  }
}
