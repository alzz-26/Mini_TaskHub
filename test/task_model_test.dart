import 'package:flutter_test/flutter_test.dart';
import 'package:todo_task/dashboard/task_model.dart';

void main() {
  group('TaskModel', () {
    test('should serialize and deserialize correctly', () {
      final task = Task(
        id: 123,
        title: 'Test Task',
        isCompleted: false,
      );

      final json = task.toJson();
      final fromJson = Task.fromJson(json);

      expect(fromJson.id, task.id);
      expect(fromJson.title, task.title);
      expect(fromJson.isCompleted, task.isCompleted);
    });
  });
}
