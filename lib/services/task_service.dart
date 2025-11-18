import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class TaskService {
  static const String className = "Tasks";

  // CREATE
  static Future<bool> createTask(String title, String description) async {
    final task = ParseObject(className)
      ..set("title", title)
      ..set("description", description);

    final response = await task.save();
    return response.success;
  }

  // READ
  static Future<List<ParseObject>> getTasks() async {
    final query = QueryBuilder(ParseObject(className));
    final response = await query.query();

    if (response.success && response.results != null) {
      return response.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  // UPDATE
  static Future<bool> updateTask(
      String id, String title, String description) async {
    final task = ParseObject(className)
      ..objectId = id
      ..set("title", title)
      ..set("description", description);

    final response = await task.save();
    return response.success;
  }

  // DELETE
  static Future<bool> deleteTask(String id) async {
    final task = ParseObject(className)..objectId = id;
    final response = await task.delete();
    return response.success;
  }
}
