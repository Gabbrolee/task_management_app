import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/utils/context_extension.dart';
import 'package:task_management_app/common/widget/app_style.dart';
import 'package:task_management_app/common/widget/custom_button.dart';
import 'package:task_management_app/common/widget/custom_textfield.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:task_management_app/features/todo/providers/dates/date_provider.dart';

import '../../../common/model/task_model.dart';
import '../providers/todo_provider.dart';

class UpdateTaskScreen extends ConsumerStatefulWidget {
  const UpdateTaskScreen({Key? key, required this.id, required this.description, required this.title}) : super(key: key);
  final int id;
  final String title;
  final String description;

  @override
  ConsumerState<UpdateTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<UpdateTaskScreen> {
  final TextEditingController titleUpdate = TextEditingController(text: title);
  final TextEditingController descriptionUpdate = TextEditingController(text: description);
  @override
  Widget build(BuildContext context) {
    final scheduleDate = ref.watch(dateStateProvider);
    final startTime = ref.watch(startTimeStateProvider);
    final finishTime = ref.watch(finishTimeStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            const HeightSpacer(height: 20),
            CustomTextField(
              hintText: "Add title",
              controller: titleUpdate,
              hintStyle: appStyle(16, AppConstant.kGreyLight, FontWeight.w600),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              hintText: "Add description",
              controller: descriptionUpdate,
              hintStyle: appStyle(16, AppConstant.kGreyLight, FontWeight.w600),
            ),
            const HeightSpacer(height: 20),
            CustomButton(
                onTap: () {
                  picker.DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2023, 7, 26),
                      maxTime: DateTime(2030, 6, 7),
                      theme: const picker.DatePickerTheme(
                          doneStyle: TextStyle(
                              color: AppConstant.kGreen,
                              fontSize: 16)), onConfirm: (date) {
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
                },
                height: 52.h,
                width: AppConstant.kWidth,
                color: AppConstant.kLight,
                buttonColor: AppConstant.kBlueLight,
                text: scheduleDate == ""
                    ? "Set  Date"
                    : scheduleDate.substring(0, 10)),
            const HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    onTap: () {
                      picker.DatePicker.showTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    height: 52.h,
                    width: AppConstant.kWidth * 0.4,
                    color: AppConstant.kLight,
                    buttonColor: AppConstant.kBlueLight,
                    text: startTime == ""
                        ? "Start Time"
                        : startTime.substring(10, 16)),
                CustomButton(
                    onTap: () {
                      picker.DatePicker.showTimePicker(context,
                          showTitleActions: true, onConfirm: (date) {
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setStart(date.toString());
                      }, locale: picker.LocaleType.en);
                    },
                    height: 52.h,
                    width: AppConstant.kWidth * 0.4,
                    color: AppConstant.kLight,
                    buttonColor: AppConstant.kBlueLight,
                    text: finishTime == ""
                        ? "Finish Time"
                        : finishTime.substring(10, 16)),
              ],
            ),
            const HeightSpacer(height: 20),
            CustomButton(
                onTap: () {
                  if (titleUpdate.text.isNotEmpty &&
                      descriptionUpdate.text.isNotEmpty &&
                      startTime.isNotEmpty &&
                      finishTime.isNotEmpty) {
                    ref.read(todoStateProvider.notifier).updateTodoItem(
                      widget.id,
                      titleUpdate.text,
                      descriptionUpdate.text,
                      0,
                      scheduleDate,
                      startTime.substring(10, 16),
                      finishTime.substring(10, 16),
                    );
                    ref.read(startTimeStateProvider.notifier).setStart("");
                    ref.read(finishTimeStateProvider.notifier).setStart("");
                    ref.read(dateStateProvider.notifier).setDate("");
                    context.pop();
                  } else {
                    print("fail to add task");
                  }
                },
                height: 52.h,
                width: AppConstant.kWidth * 0.4,
                color: AppConstant.kLight,
                buttonColor: AppConstant.kGreen,
                text: "Update"),
          ],
        ),
      ),
    );
  }
}
