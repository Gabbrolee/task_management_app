import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/features/todo/widget/todo_tile.dart';
import '../../../common/model/task_model.dart';
import '../../../common/utils/constant.dart';
import '../pages/update_task_screen.dart';
import '../providers/todo_provider.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getTodayTodos();
    var todayList = listData
        .where((element) =>
            element.isCompleted == 0 && element.date!.contains(today))
        .toList()
        .reversed
        .toList();
    return ListView.builder(
        itemCount: todayList.length,
        itemBuilder: (BuildContext context, int index) {
          final today = todayList[index];
          bool isCompleted =
              ref.read(todoStateProvider.notifier).getStatus(today);
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            title: today.title,
            description: today.description,
            start: today.starttime,
            end: today.endtime,
            color: color,
            switcher: Switch(
              value: isCompleted,
              onChanged: (value) {
                ref.read(todoStateProvider.notifier).markTodoItemAsDone(
                      today.id ?? 0,
                      today.title ?? "",
                      today.description ?? "",
                      1,
                      today.date ?? "",
                      today.starttime ?? "",
                      today.endtime ?? "",
                    );
              },
            ),
            delete: () {
              ref
                  .read(todoStateProvider.notifier)
                  .deleteTodoItem(today.id ?? 0);

              editWidget:
              GestureDetector(
                onTap: () {
                  title = today.title ?? "";
                  description = today.description ?? "";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              UpdateTaskScreen(
                                id: today.id ?? 0,
                                title: title,
                                description: description,
                              )));
                },
                child: const Icon(MaterialCommunityIcons.circle_edit_outline),
              );
            });
        });
  }
}
