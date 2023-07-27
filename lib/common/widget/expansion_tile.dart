import 'package:flutter/material.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/title.dart';

class AppExpansionTile extends StatelessWidget {
  const AppExpansionTile(
      {Key? key,
      required this.text,
      required this.text2,
      this.onExpansionChanged,
      this.trailing,
      required this.children})
      : super(key: key);
  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstant.kBkLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstant.kRadius),
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: BottomTitles(
            text: text,
            text2: text2,
          ),
          tilePadding: EdgeInsets.zero,
          onExpansionChanged: onExpansionChanged,
          controlAffinity: ListTileControlAffinity.trailing,
          children: children,
        ),
      ),
    );
  }
}
