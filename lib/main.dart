import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:hivee/model/Todo.dart';
import 'package:hivee/screen/homescreen.dart';
import 'package:hivee/db/Todo_db.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  await Hive.openBox<Todo>('todos');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hive Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:TodoListView (),
      ),
    );
  }
}
