import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/features/todo/providers/todo_provider.dart';
import 'package:task_management_app/features/todo/widget/todo_tile.dart';

import '../../../common/widget/expansion_tile.dart';
import '../pages/update_task_screen.dart';
import '../providers/expansion_provider.dart';

class DayAfterTomorrowTasks extends ConsumerWidget {
  const DayAfterTomorrowTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    final dayAfterTomorrow =
        ref.read(todoStateProvider.notifier).getAfterTomorrowTodos();
    final tomorrowTasks = todos
        .where((element) => element.date!.contains(dayAfterTomorrow))
        .toList();
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    return AppExpansionTile(
        text: DateTime.now()
            .add(const Duration(days: 2))
            .toString()
            .substring(5, 10),
        text2: "Day After Tomorrow' Task",
        onExpansionChanged: (bool expanded) {
          ref.read(expansionStateProvider.notifier).setStart(!expanded);
        },
        trailing: Padding(
          padding: EdgeInsets.only(right: 12.0.w),
          child: ref.watch(expansionStateProvider)
              ? const Icon(Icons.keyboard_arrow_up, color: Colors.blue)
              : const Icon(Icons.keyboard_arrow_down, color: Colors.red),
        ),
        children: [
          for (final todo in tomorrowTasks)
            TodoTile(
              title: todo.title,
              description: todo.description,
              color: color,
              start: todo.starttime,
              end: todo.endtime,
              switcher: const SizedBox.shrink(),
              delete: () {
                ref
                    .read(todoStateProvider.notifier)
                    .deleteTodoItem(todo.id ?? 0);
              },
              editWidget: GestureDetector(
                onTap: () {
                  title = todo.title ?? "";
                  description = todo.description ?? "";
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateTaskScreen(
                                id: todo.id ?? 0,
                                description: description,
                                title: title,
                              )));
                },
                child: const Icon(MaterialCommunityIcons.circle_edit_outline),
              ),
            )
        ]);
  }
}
