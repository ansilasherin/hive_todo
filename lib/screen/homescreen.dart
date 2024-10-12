// views/todo_list_view.dart
import 'package:flutter/material.dart';
import 'package:hivee/db/Todo_db.dart';
import 'package:hivee/components/alert_todo.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context);
    return Scaffold(
         backgroundColor: Colors.blueGrey.shade200,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          title: Text('TO DO', style: GoogleFonts.sedgwickAve(fontSize: 30)),
          backgroundColor: Colors.blueGrey.shade200,
          elevation: 0,
        ),
      ),
      body: ListView.builder(
        itemCount: todoViewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = todoViewModel.todos[index];
          return Card(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(10)),
              height: 100,
              child: Center(
                child: ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (_) => todoViewModel.toggleTodoCompletion(index),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => todoViewModel.deleteTodoAt(index),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTodoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
