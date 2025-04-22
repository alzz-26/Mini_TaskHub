import 'package:supabase_flutter/supabase_flutter.dart';
import '../dashboard/task_model.dart';

class SupabaseService {
  final _client = Supabase.instance.client;

  Future<List<Task>> fetchTasks() async {
    final res = await _client.from('tasks').select();
    return (res as List).map((e) => Task.fromJson(e)).toList();
  }

  Future<void> addTask(String title) async {
    await _client.from('tasks').insert({'title': title, 'is_completed': false, 'user_id': _client.auth.currentUser!.id,});
  }

  Future<void> deleteTask(int id) async {
    await _client.from('tasks').delete().eq('id', id);
  }

  Future<void> toggleTaskCompletion(Task task) async {
    await _client
        .from('tasks')
        .update({'is_completed': !task.isCompleted})
        .eq('id', task.id);
  }
}
