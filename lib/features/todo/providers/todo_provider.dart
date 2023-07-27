import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:task_management_app/common/helpers/db_helper.dart';
import 'package:task_management_app/common/model/task_model.dart';
import '../../../common/utils/constant.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getUserItems();
    state = data.map((e) => Task.fromJson(e)).toList();
  }

  void addTodoItem(Task task) async {
    await DBHelper.createItem(task);
    refresh();
  }

  dynamic getRandomColor(){
    Random random = Random();
    int randomIndex = random.nextInt(colors.length);
    return colors[randomIndex];
  }

  void updateTodoItem(int id, String title, String description, int isCompleted,
      String date, String startTime, String endTime) async {
    await DBHelper.updateUserItem(
        id, title, description, isCompleted, date, startTime, endTime);
    refresh();
  }


  Future<void> deleteTodoItem(int id ) async {
    await DBHelper.deleteUserItem(id);
    refresh();
  }


  void markTodoItemAsDone(int id, String title, String description, int isCompleted,
      String date, String startTime, String endTime) async {
    await DBHelper.updateUserItem(
        id, title, description, 1, date, startTime, endTime);
    refresh();
  }

  ///today
  String getTodayTodos() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

  ///tomorrow
  String getTomorrowTodos() {
    DateTime tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.toString().substring(0, 10);
  }

  ///day after tomorrow
  String getAfterTomorrowTodos(){
    DateTime afterTomorrow = DateTime.now().add(const Duration(days: 2));
    return afterTomorrow.toString().substring(0,10);
  }

  /// last 30 days
  List<String> getLast30daysTodos(){
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(days: 30));

    List<String> dates = [];
    for(int day = 0; day < 30; day++){
      DateTime date = oneMonthAgo.add(Duration(days: day));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(Task data){
    bool? isCompleted;
    if(data.isCompleted == 0){
      isCompleted = false;
    }else {
      isCompleted = true;
    }
    return isCompleted;
  }
}
