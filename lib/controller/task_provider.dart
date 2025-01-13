import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supadatabaseapp/controller/services/get_current_user.dart';
import 'package:supadatabaseapp/model/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> _tasks = [];
  List<TaskModel> get tasks => _tasks;
  

  final supabase = Supabase.instance.client;

  // Fetch tasks from Supabase
  Future<void> fetchTasks() async {
    final data=await GetCurrentUser().getCurrentUserData();
    try {
      final response = await supabase.from('task_table').select().eq('userId', data.id);
      print(response);
      if (response != null) {
        _tasks = (response as List)
            .map((data) => TaskModel.fromJson(data))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      print('Error fetching tasks: $e');
    }
  }

  // Add a new task
  Future<void> addTask(String task, String taskDesc,int id) async {
    try {
      await supabase.from('task_table').insert({'task': task, 'task_desc': taskDesc,'userId':id});
      fetchTasks();
    } catch (e) {
      print('Error adding task: $e');
    }
  }

  // Update an existing task
  Future<void> updateTask(int id, String task, String taskDesc) async {
    try {
      await supabase
          .from('task_table')
          .update({'task': task, 'task_desc': taskDesc})
          .eq('id', id);
      fetchTasks();
    } catch (e) {
      print('Error updating task: $e');
    }
  }

  // Delete a task
  Future<void> deleteTask(int id) async {
    try {
      await supabase.from('task_table').delete().eq('id', id);
      fetchTasks();
    } catch (e) {
      print('Error deleting task: $e');
    }
  }
}
