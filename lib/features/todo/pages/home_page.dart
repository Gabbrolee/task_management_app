import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/common/widget/custom_textfield.dart';
import 'package:task_management_app/common/widget/height_spacer.dart';
import 'package:task_management_app/common/widget/reusable_text.dart';
import 'package:task_management_app/common/widget/width_spacer.dart';
import 'package:task_management_app/features/todo/pages/add_task_screen.dart';
import 'package:task_management_app/features/todo/providers/todo_provider.dart';
import 'package:task_management_app/features/todo/widget/completed_tasks.dart';
import '../../../common/widget/app_style.dart';
import '../widget/day_after_tomorrow_tasks.dart';
import '../widget/today_task.dart';
import '../widget/tomorrow_task.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  final TextEditingController search = TextEditingController();
  late final TabController tabController =
      TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    ref.watch(todoStateProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(85),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: "Dashboard",
                        style:
                            appStyle(18, AppConstant.kLight, FontWeight.bold),
                      ),
                      Container(
                        width: 25.w,
                        height: 25.h,
                        decoration: const BoxDecoration(
                            color: AppConstant.kLight,
                            borderRadius: BorderRadius.all(Radius.circular(9))),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AddTaskScreen()));
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppConstant.kBkDark,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(height: 20),
                CustomTextField(
                  hintText: "Search",
                  controller: search,
                  prefixIcon: Container(
                    padding: EdgeInsets.all(14.h),
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        AntDesign.search1,
                        color: AppConstant.kGreyLight,
                      ),
                    ),
                  ),
                  suffixIcon: const Icon(
                    FontAwesome.sliders,
                    color: AppConstant.kGreyLight,
                  ),
                ),
                const HeightSpacer(height: 15),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                const HeightSpacer(height: 25),
                Row(
                  children: [
                    const Icon(
                      FontAwesome.tasks,
                      size: 20,
                      color: AppConstant.kLight,
                    ),
                    const WidthSpacer(width: 10),
                    ReusableText(
                        text: "Today's task",
                        style: appStyle(
                          18,
                          AppConstant.kLight,
                          FontWeight.bold,
                        ))
                  ],
                ),
                const HeightSpacer(height: 25),
                Container(
                  decoration: BoxDecoration(
                      color: AppConstant.kLight,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstant.kRadius))),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                      color: AppConstant.kGreyLight,
                      borderRadius: BorderRadius.all(
                          Radius.circular(AppConstant.kRadius)),
                    ),
                    controller: tabController,
                    labelPadding: EdgeInsets.zero,
                    labelStyle:
                        appStyle(24, AppConstant.kBlueLight, FontWeight.w700),
                    unselectedLabelColor: AppConstant.kLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: AppConstant.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                              text: "Pending",
                              style: appStyle(
                                  16, AppConstant.kBkDark, FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: EdgeInsets.only(left: 30.w),
                          width: AppConstant.kWidth * 0.5,
                          child: Center(
                            child: ReusableText(
                              text: "Completed",
                              style: appStyle(
                                  16, AppConstant.kBkDark, FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(height: 20),
                SizedBox(
                  height: AppConstant.kHeight * 0.3,
                  width: AppConstant.kWidth,
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppConstant.kRadius)),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Container(
                            color: AppConstant.kBkLight,
                            height: AppConstant.kHeight * 0.3,
                            child: const TodayTask()),
                        Container(
                          color: AppConstant.kBkLight,
                          height: AppConstant.kHeight * 0.3,
                          child: const CompletedTasks(),
                        ),
                      ],
                    ),
                  ),
                ),
                const HeightSpacer(height: 20),
                const TomorrowTask(),
                const HeightSpacer(height: 20),
                const DayAfterTomorrowTasks()
              ],
            ),
          ),
        ));
  }
}
