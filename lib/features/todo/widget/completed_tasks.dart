import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management_app/common/utils/constant.dart';
import 'package:task_management_app/features/todo/widget/todo_tile.dart';
import '../../../common/model/task_model.dart';
import '../providers/todo_provider.dart';


class CompletedTasks extends ConsumerWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    List<String> last30Days = ref.read(todoStateProvider.notifier).getLast30daysTodos();
    var completedTodosList = listData
        .where((element) =>
    element.isCompleted == 1 || last30Days.contains(element.date!.substring(0,10)))
        .toList()
        .reversed
        .toList();
    return ListView.builder(
        itemCount: completedTodosList.length,
        itemBuilder: (BuildContext context, int index) {
          final completedTodo = completedTodosList[index];
          dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
          return TodoTile(
            title: completedTodo.title,
            description: completedTodo.description,
            start: completedTodo.starttime,
            end: completedTodo.endtime,
            color: color,
            switcher: const Icon(Icons.check_circle_outline_outlined, color: AppConstant.kGreen,),
            delete: (){
              ref.read(todoStateProvider.notifier).deleteTodoItem(completedTodo.id ?? 0);
            },
            editWidget: const SizedBox.shrink()
          );
        });
  }
}
