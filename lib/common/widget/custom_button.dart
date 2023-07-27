import 'package:flutter/material.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.height,
      required this.width,
       this.buttonColor,
        required this.color,
      required this.text})
      : super(key: key);
  final VoidCallback onTap;
  final double height;
  final double width;
  final Color? buttonColor;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: color)),
        child: Center(
          child: ReusableText(
            text: text,
            style: appStyle(18, color, FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
