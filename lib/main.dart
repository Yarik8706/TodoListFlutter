import 'package:flutter/material.dart';
import 'package:flutter_todolist/pages/todolist.dart';
import 'package:flutter_todolist/pages/trash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
        textTheme: const TextTheme(
          caption: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
          subtitle1: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
              fontSize: 20
          ),
        )
      ),
      initialRoute: '/todo',
      routes: {
        '/todo': (context) => ToDoList(),
        '/trash': (context) => TrashPage()
      },
    );
  }
}
