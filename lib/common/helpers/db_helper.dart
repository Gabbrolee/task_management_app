import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:task_management_app/common/model/task_model.dart';

class DBHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
      "CREATE TABLE todos("
      "id INTEGER PRIMARY KEY AUTOINCREMENT, "
      "title STRING, description TEXT, date STRING, "
      "starttime STRING, endtime STRING, "
      "remind INTEGER, repeat STRING, "
      "isCompleted INTEGER"
      ")",
    );

    await database.execute("CREATE TABLE user("
        "id INTEGER PRIMARY KEY AUTOINCREMENT DEFAULT 0, "
        "isVerified INTEGER"
        ")");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase("taskmanagement", version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  static Future<int> createItem(Task task) async {
    final db = await DBHelper.db();

    final id = await db.insert("todos", task.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> createUser(int isVerified) async {
    final db = await DBHelper.db();

    final data = {
      'id': 1,
      'isVerified': isVerified,
    };

    final id = await db.insert("user", data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await DBHelper.db();
    return db.query("user", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getUserItems() async {
    final db = await DBHelper.db();
    return db.query("todos", orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getSingleItemOfUser(int id) async {
    final db = await DBHelper.db();
    return db.query("todos", where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateUserItem(int id, String title, String description,
      int isCompleted, String date, String startTime, String endTime) async {
    final db = await DBHelper.db();
    final data = {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'date': date,
      'starttime': startTime,
      'endtime': endTime
    };

    final result =
        await db.update('todos', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteUserItem(int id) async {
    final db = await DBHelper.db();

    try{
      db.delete("todos", where: "id = ?", whereArgs: [id]);
    }catch(e){
      debugPrint("Unable to delete");
    }
  }
}
