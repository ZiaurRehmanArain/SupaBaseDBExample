import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supadatabaseapp/model/task_model.dart';

class DBTestStream {
    final supabase = Supabase.instance.client;

    Future<void> addTask(String task, String taskDesc) async {
    try {
      await supabase.from('task_table').insert({'task': task, 'task_desc': taskDesc});
          } catch (e) {
      print('Error adding task: $e');
    }
  }

  final stream = Supabase.instance.client.from('task_table').stream(primaryKey: ['id']).map((data)=>data.map((notedata)=>TaskModel.fromJson(notedata)).toList());

    Future<void> UpdateTask(String task, String taskDesc) async {
    try {
      await supabase.from('task_table').insert({'task': task, 'task_desc': taskDesc});
          } catch (e) {
      print('Error adding task: $e');
    }
  }

    Future<void> DeleteTask(String task, String taskDesc) async {
    try {
      await supabase.from('task_table').insert({'task': task, 'task_desc': taskDesc});
          } catch (e) {
      print('Error adding task: $e');
    }
  }
}