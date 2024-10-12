
  import 'package:flutter/material.dart';
import 'package:hivee/db/Todo_db.dart';
import 'package:provider/provider.dart';

void showAddTodoDialog(BuildContext context) {
    final todoViewModel = Provider.of<TodoViewModel>(context, listen: false);
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 213, 213, 211),
          title: Text('Add Todo'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Todo Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final title = controller.text;
                if (title.isNotEmpty) {
                  todoViewModel.addTodo(title);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }