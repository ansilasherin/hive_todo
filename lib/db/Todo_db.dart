// viewmodels/todo_view_model.dart
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivee/model/Todo.dart';

class TodoViewModel extends ChangeNotifier {
  final Box<Todo> _todoBox = Hive.box<Todo>('todos');

  List<Todo> get todos => _todoBox.values.toList();

  void addTodo(String title) {
    final newTodo = Todo(
      title: title,
    );
    _todoBox.add(newTodo);
    notifyListeners();
  }

   toggleTodoCompletion(int index) {
    final todo = _todoBox.getAt(index);
    if (todo != null) {
      todo.isCompleted = !todo.isCompleted;
      todo.save();
      notifyListeners();
    }
  }

   deleteTodoAt(int index) {
    _todoBox.deleteAt(index);
    notifyListeners();
  }
}
