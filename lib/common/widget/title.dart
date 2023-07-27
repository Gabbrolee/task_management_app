import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';
import 'package:task_management_app/common/widget/width_spacer.dart';

import '../../features/todo/providers/todo_provider.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles(
      {Key? key, required this.text, required this.text2, this.color})
      : super(key: key);

  final String text;
  final String text2;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConstant.kWidth,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) {
                var color =
                    ref.read(todoStateProvider.notifier).getRandomColor();
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConstant.kRadius)),
                    color: color,
                  ),
                );
              },
            ),
            const WidthSpacer(width: 15),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: text,
                      style: appStyle(24, AppConstant.kLight, FontWeight.bold)),
                  const HeightSpacer(height: 10),
                  ReusableText(
                      text: text2,
                      style:
                          appStyle(12, AppConstant.kLight, FontWeight.normal)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
